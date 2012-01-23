object TicTacToe {
    def main(args: Array[String]): Unit = {
        println("hello world")
    
        args.foreach {arg => 
            println(arg)
            }
      //  rows = args.map
                
       val ourBoard = new Board(args)
    }

    
    class Board (rows: Array[String]) {
        val board = Array (
        rows(0),rows(1),rows(2),
        "" + rows(0)(0) +  rows(1)(0) +rows(2)(0),
        "" + rows(0)(1) +  rows(1)(1) +rows(2)(1),
        "" + rows(0)(2) +  rows(1)(2) +rows(2)(2),
        
        "" + rows(0)(2) +  rows(1)(1) +rows(2)(0),
        "" + rows(0)(0) +  rows(1)(1) +rows(2)(2))
            
                    
   
        
        
        val wins = board.filter{ s => s(0) == s(1) && s(1) == s(2) && s(0) != ' '}
        
        if(wins.length > 0) 
            println(wins(0) + " wins!");
        else {
        
        val dones = board.filter{ s => s(0) != ' ' && s(1) != ' '&& s(2) != ' '}
        if(dones.length == board.length) println ("tied")
        else println("still moves to make")
        }
        
        
        
        def status =  {
            "don't know yet"
        }

    

    }
    
    
}

/*
    a fairly unsatisfying solution, hindered by syntax and library naivite

*/

