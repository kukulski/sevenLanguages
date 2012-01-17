Number regularDiv := Number getSlot("/")

1 regularDiv(2) println

Number / = method(b,
result := if(b==0,0, self regularDiv(b))
self print 
"/" print
b print
"=" print
result println
result
)

"now in the wild" println
(1/0) println

(1/2) println
