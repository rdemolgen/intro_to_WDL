version 1.0

import "docker.wdl" as dockerTask

workflow Docker {
    input {
        String name
        File inputFile
        Int expectedCount
    }

    call dockerTask.countLinesDocker {
        input:
            helloName = name,
            inputFile = inputFile,
            expectedCount = expectedCount
    }

    output {
        String checkCount = countLinesDocker.checkCount
    }
}
