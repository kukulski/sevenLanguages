

my2d := list(list(1,2,3), list(4,5,6), list(10,10,10))




List sum := method(
rval := 0
foreach(v,  rval = rval + v) 
)

List nestedsum := method(
a := 0
foreach(v, a = a + v sum) 
)

my2d nestedsum println