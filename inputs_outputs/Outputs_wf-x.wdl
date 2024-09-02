version 1.0

import "Outputs-x.wdl" as outputsTask

workflow Outputs {
    input {
        String name
    }

    call outputsTask.helloOutputs {
        input:
            helloName = name
    }

    output {
        File fileGreeting = helloOutputs.fileGreeting
        String strGreeting = helloOutputs.strGreeting
        Boolean boolGreeting = helloOutputs.boolGreeting
    }
}
