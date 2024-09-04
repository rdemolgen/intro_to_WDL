version 1.0

import "helloWorld.wdl" as helloWorldTask

workflow Greetings {
    input {
        String nameA
        String nameB
    }

    call helloWorldTask.helloWorld {
        input:
            helloName = nameA
    }

    call helloWorldTask.helloWorld {
        input:
            helloName = nameB
    }

    output {
        String greetingOutA = helloA.greeting
        String greetingOutB = helloB.greeting
    }
}
