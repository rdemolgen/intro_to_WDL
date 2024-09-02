version 1.0 # WDL version

task countLinesDocker {
    input {
        String helloName
        File inputFile
        Int expectedCount
    }

    command <<<
        numLines=`cat ~{inputFile} | wc -l`
        if [[ $numLines -eq ~{expectedCount} ]]; then
            echo "Hello ~{helloName}, line count matches" > outCount.txt
        else
            echo "Error! Incorrect number of lines in file" > outCount.txt
        fi
    >>>

    output {
        String checkCount = read_string("outCount.txt")
    }

    runtime {
        docker: "ubuntu:latest"
    }
}
