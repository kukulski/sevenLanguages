
Number difference := method (b, (self-b) abs)

Number fourBranch := method ( less, equal, greater, other, 
    if( isNan, other, threeBranch(less, equal, greater)))


Number threeBranch := method ( less, equal, greater, 
    if(self < 0, less, if(self > 0, greater, equal)))



WarmCold := Object clone

WarmCold start := method(

    self myNumber := (Random value * 100) floor +1; 
    self prompt := "I'm thinking of a number from 1 to 100.\n"
    self guessCount := 1
    self lastGuess := Number constants nan
        
    loop( 
        guess := readGuess
        updateOrWin(guess)
     )
)

WarmCold readGuess := method (
    File standardInput readLine(prompt) asNumber
    )

WarmCold updateOrWin := method (guess,
        
    if(guess == myNumber, win, 
            updatePrompt(guess))
       
        guessCount = guessCount + 1;
    )

    
WarmCold win := method (
    ("good! only " .. guessCount .. " guesses.")  println
    System exit(0)
    )

WarmCold updatePrompt := method (guess,
    prompt = warmerColder (guess, lastGuess)
    self lastGuess := guess
    )

WarmCold warmerColder := method ( guess, lastGuess,
    namedCompare( guess difference(myNumber), 
                lastGuess difference(myNumber))
    )

WarmCold namedCompare := method (a, b,
    difference := a-b
    word := difference fourBranch("warmer", "same", "colder", "wrong")
    "  " .. word .. ".\n"
    )






WarmCold start