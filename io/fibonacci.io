#! /usr/local/bin/io


fib := method (num, 
    if (num < 3, 1, (fib(num -1) + fib (num -2)))
    )


"recursive" println    
for(i,1,10,fib(i) println)



fib := method (num,
    last := 1; current := 1; next := 1;
    
    for(i,3,num, next = last + current; last = current; current = next)
    
    next)
    
"iterative" println    
for(i,1,10,fib(i) println)
