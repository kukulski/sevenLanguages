myLast(Hd, [Hd|[]]).
myLast(Other, [_|Tail]) :- myLast(Other,Tail). 

  
count(0,[]).
count(Count, [_|T]) :- count(TailCount, T), Count is TailCount +1.


sum(0,[]).
sum(Total, [Head|T]) :- sum(SubTotal, T), Total is SubTotal +Head.

average(Avg,List) :- sum(Sum,List), count(Count,List), Avg is Sum/Count;
average(0,[]).


concatenate([],     List,  List).
concatenate([Head|Tail1],    List,  [Head|Tail2]) :-
    concatenate(Tail1, List, Tail2).


fib(0,0).
fib(1,1).
fib(N,Fib) :- 
    N > 1,
    N1 is N-1, N2 is N-2,
    fib(N1,F1), fib(N2,F2), 
    Fib is F1 + F2.
