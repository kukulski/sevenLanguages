

WarmCold := Object clone

WarmCold start := method(
    self myNumber := (Random value * 100) floor +1; 
    
    self stdIn := File standardInput
 
    prompt := "I'm thinking of a number from 1 to 100. "
    alreadyGuessed := false
     
    loop(
        guess := stdIn readLine(prompt) asNumber
        offBy := (guess - myNumber) abs
       
        if( offBy == 0, "good!" println; System exit(0), nil)
        
        prompt = if( alreadyGuessed, 
                    further := offBy < missedLastTimeBy
                     if( further, "warmer. ","colder. "), "wrong. ")

        missedLastTimeBy := offBy;
        alreadyGuessed = true;
    )
)

WarmCold start