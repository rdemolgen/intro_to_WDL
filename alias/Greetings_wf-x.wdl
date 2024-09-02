version 1.0

import "helloWorld-x.wdl" as helloWorldTask

workflow Greetings {
    input {
        String nameA
        String nameB
    }

    call helloWorldTask.helloWorld as helloA {
        input:
            helloName = nameA
    }

    call helloWorldTask.helloWorld as helloB {
        input:
            helloName = nameB
    }

    output {
        String greetingOutA = helloA.greeting
        String greetingOutB = helloB.greeting
    }
}
