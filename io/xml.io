OperatorTable addAssignOperator(":", "kvPut")

kvPut := Object getSlot("list")

"a" : "b" writeln

Map kvPut := method(key,val,atPut(key stripQuote, val))

Sequence stripQuote := method(asMutable removePrefix("\"") removeSuffix("\""))




# START:curlyBrackets
curlyBrackets := method(
  r := Map clone;
  call message arguments foreach(arg,
       r doMessage(arg)
       )
  r
)
# END:curlyBrackets


squareBrackets := method ( call message arguments map(elt, doMessage(elt) ))



Map toXMLAttrs := method(
    asList map(elt, " " .. elt removeFirst .. "=\"" .. elt removeFirst .. "\"") join(" ")
)

{ "foo":"bar" } writeln
{ "foo" : "bar" } toXMLAttrs writeln



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
  args := call message arguments
  argZero := doMessage(args at(0))
  attrs := if( argZero type == "Map", args removeFirst; argZero, Map clone)
    
  writeln(prefix, "<", tag, attrs toXMLAttrs , ">")
  push
  args foreach(
	arg, 
	content := self doMessage(arg); 
	if(content type == "Sequence", writeln(prefix, content)))
   pop
  writeln(prefix, "</", call message name, ">"))




Builder  ul({"foo":"bar", "boodle":12},
	li("Io"), 
	li("Lua"), 
	li("JavaScript"))