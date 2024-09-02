version 1.0

task friend {
    input {
        String name
    }

    command <<<
        echo "Hello ~{name}! you are my friend :)"
    >>>

    output {
        String friendGreeting = read_string(stdout())
    }
}

task enemy {
    input {
        String name
    }

    command <<<
        echo "Hello ~{name}, you are my enemy >:("
    >>>

    output {
        String enemyGreeting = read_string(stdout())
    }
}

task picard {
    input {
        String name
    }

    command <<<
        echo "Live long and prosper, Captain ~{picard}"
    >>>

    output {
        String picardGreeting = read_string(stdout())
    }
}