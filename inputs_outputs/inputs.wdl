version 1.0 # WDL version

task countLines {
    input {
        String helloName
        File inputFile
        Int expectedCount
        String outName = sub(basename(inputfile), "\\.txt$", "") # basename(File) removes the filepath from the input, sub(String, "A", "B") replaces the regex pattern 'A' with the string in 'B'
    }

    command <<<
        numLines=`cat ~{inputFile} | wc -l`
        if [[ $numLines -eq ~{expectedCount} ]]; then
            echo "Hello ~{helloName}, line count matches" > ~{outName}_count.txt
        else
            echo "Error! Incorrect number of lines in file" > ~{outName}_count.txt
        fi
    >>>

    output {
        String checkCount = read_string("~{outName}_cont.txt")
    }
}
