List numbersOnly := method(

    self select (x, x proto == Number)
)


List myAverage := method (
 self numbersOnly average

)


list(1,2,3,"foo","fish") myAverage println

// list("foo","bar") myAverage println


List complainyAverage := method (
    self foreach(v, if(v proto == Number, nil, Exception raise("we only want numbers"))) 

    self average
)


list(1,2,3) complainyAverage println

list(1,2,3,"bad") complainyAverage println