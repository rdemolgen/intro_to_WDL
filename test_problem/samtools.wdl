version 1.0

task samtoolsFlagstat {
    input {
        File bam
        String outName = sub(basename(bam),"\\.bam$", "")
    }

    command <<<
        samtools flagstat ~{bam} > ~{outName}_flagstat
    >>>

    output {
        File flagstat = "~{outName}_flagstat"
    }

    runtime {
        docker: "swglh/samtools:1.18"
    }
}

task samtoolsView {
    input {
        File bam
        File index
        String outName = sub(basename(bam),"\\.bam$", "")
    }

    command <<<
        ln -s ~{bam} ~{basename(bam)}
        ln -s ~{index} ~{basename(index)}
        samtools view -bh ~{basename(bam)} 21 > ~{outName}_chr21.bam
    >>>

    output {
        File subsetBam = "~{outName}_chr21.bam"
    }

    runtime {
        docker: "swglh/samtools:1.18"
    }
}

task samtoolsIndex {
    input {
        File bam
        String outName = basename(bam)
    }

    command <<<
        samtools index ~{bam}
        cp `find ../inputs/ -name ~{outName}.bai` .
    >>>

    output {
        File bamIndex = "~{outName}.bai"
    }

    runtime {
        docker: "swglh/samtools:1.18"
    }
}