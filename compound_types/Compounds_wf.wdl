version 1.0

import "compoundTypes.wdl" as compoundTask

workflow Compounds {
    input {
        Array[String] names
        Pair[String, Int] captainKirk
    }

    call compoundTask.helloArrays {
        input:
            names = names
    }

    call compoundTask.helloPairs {
        input:
            name = captainKirk.left,
            age = captainKirk.right
    }

    output {
        String arrayGreeting = helloArrays.greeting
        String pairGreeting = helloPairs.greeting
    }
}
