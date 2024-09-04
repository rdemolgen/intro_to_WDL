version 1.0 # WDL version

task helloWorld {
    input {
        String helloName
    }

    command <<<
        echo "Hello ~{helloName}!"
    >>>

    output {
        String greeting = read_string(stdout())
    }
}
