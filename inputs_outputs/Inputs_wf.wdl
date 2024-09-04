version 1.0

import "inputs.wdl" as inputsTask

workflow Inputs {
    input {
        String name
        File inputFile
        Int expectedCount
    }

    call inputsTask.countLines {
        input:
            helloName = name,
            inputFile = inputFile,
            expectedCount = expectedCount
    }

    output {
        String checkCount = countLines.checkCount
    }
}
