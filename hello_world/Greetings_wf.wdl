version 1.0

import "helloWorld.wdl" as helloWorldTask

workflow Greetings {
    input {
        String name
    }

    call helloWorldTask.helloWorld {
        input:
            helloName = name
    }

    output {
        String greetingOut = helloWorld.greeting
    }
}
