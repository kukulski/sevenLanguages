# START:range
OperatorTable addAssignOperator(":", "atPutNumber")
# END:range

# START:curlyBrackets
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
       r doMessage(arg)
       )
  r
)
# END:curlyBrackets

squareBrackets := method ( call message arguments map(elt, doMessage(elt) ))

# START:atPutNumber
Map atPutNumber := method(
  self atPut(
       call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
       call evalArgAt(1))
)




# END:atPutNumber
# START:use
s := File with("phonebook.txt") openForReading contents
phoneNumbers := doString(s)
phoneNumbers keys   println
phoneNumbers values println
# END:use
Builder := Object clone
Builder depth := 0

Builder prefix := method( ".   " repeated(depth) )

Builder push := method (self depth = depth + 1)
Builder pop := method (self depth = depth - 1)


Builder forward := method(
  tag := call message name
  writeln(prefix, "<", tag, ">")
  push
  call message arguments foreach(
	arg, 
	content := self doMessage(arg); 
	if(content type == "Sequence", writeln(prefix, content)))
   pop
  writeln(prefix, "</", call message name, ">"))


Builder  ul(
	li("Io"), 
	li("Lua"), 
	li("JavaScript"))