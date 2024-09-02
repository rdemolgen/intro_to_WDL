version 1.0 # WDL version

task helloArrays {
    input {
        Array[String] names
    }

    command <<<
        echo 'Hello ~{sep="," names}!'
        for i in ~{sep=" " names}; do
            echo "Hello $i!" > ${i}_hello.txt
        done
    >>>

    output {
        String greeting = read_string(stdout())
        Array[File] helloFiles = glob("*_hello.txt")
    }
}

task helloPairs {
    input {
        String name
        Int age
    }

    command <<<
        echo 'Hello ~{name}! You are ~{age} years old'
    >>>

    output {
        String greeting = read_string(stdout())
    }
}