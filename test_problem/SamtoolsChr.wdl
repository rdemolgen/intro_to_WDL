version 1.0

import "samtools.wdl" as samtools

workflow Samtools {
    input {
        Array[File] bamFiles
        String chr
    }

    scatter (b in bamFiles) {
        call samtools.samtoolsFlagstat {
            input:
                bam=b
        }

        if (chr != "all") {
            call samtools.samtoolsIndex {
                input:
                    bam=b
            }

            call samtools.samtoolsView {
                input:
                    bam=b,
                    index=samtoolsIndex.bamIndex
            }

            call samtools.samtoolsFlagstat as subsetFlagstat {
                input:
                    bam=samtoolsView.subsetBam
            }
        }
    }

    output {
        Array[File] bamFlagstat = samtoolsFlagstat.flagstat
        Array[File]? bamIndex = samtoolsIndex.bamIndex
        Array[File]? subsetBam = samtoolsView.subsetBam
        Array[File]? subsetBamFlagstat = subsetFlagstat.flagstat
    }
}