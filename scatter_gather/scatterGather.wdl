version 1.0 # WDL version

task helloScatter {
    input {
        String name
    }

    command <<<
        echo "Hello ~{name}!"
    >>>

    output {
        String greeting = read_string(stdout())
    }
}
