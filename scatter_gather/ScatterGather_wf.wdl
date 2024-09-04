version 1.0

import "scatterGather.wdl" as scatterGatherTask

workflow ScatterGather {
    input {
        Array[String] names
    }

    scatter (n in names) {
        call scatterGatherTask.helloScatter {
            input:
                name = n
        }
    }

    output {
        String helloGather = helloScatter.greeting
    }
}
