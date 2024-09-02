version 1.0

import "samtools.wdl" as samtools

workflow Samtools {
    input {
        File bamFile
    }

    call samtools.samtoolsFlagstat {
        input:
            bam=bamFile
    }

    call samtools.samtoolsIndex {
        input:
            bam=bamFile
    }

    call samtools.samtoolsView {
        input:
            bam=bamFile,
            index=samtoolsIndex.bamIndex
    }

    call samtools.samtoolsFlagstat as subsetFlagstat {
        input:
            bam=samtoolsView.subsetBam
    }

    output {
        File bamFlagstat = samtoolsFlagstat.flagstat
        File bamIndex = samtoolsIndex.bamIndex
        File subsetBam = samtoolsView.subsetBam
        File subsetBamFlagstat = subsetFlagstat.flagstat
    }
}