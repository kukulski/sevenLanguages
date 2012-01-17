t := method(expected, actual, message,
if(expected == actual, " ok: ", "!BAD!  ") print
expected print
" :" print
message println
)

List2 := Object clone


List2 dim := method(x,y,
    rval := List2 clone
    rows := List clone
    row := List clone
    row preallocateToSize(y)
    y repeat (row push(nil))
    x repeat( 
        rows push (row clone)
        )
    rval rows := rows
    rval
)

List2 set := method(x,y, value,
    rows at(y) atPut(x,value)
)

List2 get := method(x,y,
    rows at(y) at(x)
)

List2 print := method(
    rows foreach(row, row println)
)



test := List2 dim(10,10)

test set(0,0,100)
test set(1,1,10)

t(nil,  test get (1,4), "nil cell")
test get (1,1) println

test print




"and now transpose" println


List2 getWidth := method(
    rows at(0) size
)

List2 getHeight := method(
    rows size
}


List2 transpose := method(
    rval := List2 dim (getWidth, getHeight)
    
    
    getHeight repeat(row, 
        getWidth repeat(col,
            rval set(row,col, self get(col, row))
            )
        )
    rval
)


twoByFour := List2 dim(2,4)

2 repeat(x, 4 repeat(y, twoByFour set(y,x, x toBase(10) .. y toBase(10))))

twoByFour print

fourByTwo := twoByFour transpose

fourByTwo print


List2 write := method(fileName,
    f := File clone
    f openForUpdating(fileName)
    
    f write (serialized)
    f close
)

// massively unsafe
List2 read :=  getSlot("doFile")


twoByFour write ("2by4.txt")

another := List2 read ("2by4.txt")
"and now printing"
another print

