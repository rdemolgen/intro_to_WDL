version 1.0 # WDL version

task helloOutputs {
    input {
        String helloName
    }

    command <<<
        echo "Hello ~{helloName}! I am a File" > file.txt
        echo "Hello ~{helloName}! I am a String" > string.txt
        if [[ "~{helloName}" == "Suzy" ]]; then
            echo true > bool.txt
        else
            echo false > bool.txt
        fi
    >>>

    output {
        File fileGreeting = "file.txt"
        String strGreeting = read_string("string.txt")
        Boolean boolGreeting = read_boolean("bool.txt")
    }
}
