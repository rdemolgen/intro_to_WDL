version 1.0

import "conditionals.wdl" as conditionalsTask

workflow Conditionals {
    input {
        String name
        String relationship
    }

    # if-then-else ternary operator
    Boolean friendBool = if relationship == "friend" then true else false

    # WDL conditional, if friendBool = true
    if (friendBool) {
        call conditionalsTask.friend {
                name=name
        }
        
        # nested conditional, if string equals value
        if (name == "Picard") {
            call conditionalsTask.picard {
                input:
                    name=name
            }
        }
    }

    # WDL conditional, if friendBool != true
    if (!friendBool) {
        call conditionalsTask.enemy {
            input:
                name=name
        }
    }

    output {
        String? friendGreeting = friend.friendGreeting
        String? enemyGreeting = enemy.enemyGreeting
        String picardGreeting = picard.picardGreeting
    }
}
