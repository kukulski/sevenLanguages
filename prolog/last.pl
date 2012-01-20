myLast(Hd, [Hd|[]]).
myLast(Other, [_|Tail]) :- myLast(Other,Tail). 

  
count(0,[]).
count(Count, [_|T]) :- count(TailCount, T), Count is TailCount +1.


sum(0,[]).
sum(X,[X]).
sum(Total, [Head|T]) :- sum(SubTotal, T), Total is SubTotal +Head.

bisum(0,[]).
%% bisum(X,[X]).
bisum(Total, [Head|T]) :- bisum(SubTotal, T), Total #=# SubTotal +Head.






average(Avg,List) :- sum(Sum,List), count(Count,List), Avg is Sum/Count;
average(0,[]).


biaverage(Avg,List) :- bisum(Sum,List), count(Count,List), Avg #=# Sum/Count;
biaverage(0,[]).



concatenate([],     List,  List).
concatenate([Head|Tail1],    List,  [Head|Tail2]) :-
    concatenate(Tail1, List, Tail2).


fibr(0,0).
fibr(1,1).
fibr(N,Fib) :- 
    N > 1,
    N1 is N-1, N2 is N-2,
    fibr(N1,F1), fibr(N2,F2), 
    Fib is F1 + F2.



fib(N,Fib) :- fibList(N,[Fib|_]).
fibList(0,[0]).
fibList(1,[1,0]).
fibList(N,[Fib|Tail]) :- N > 0, N1 is N-1, fibList(N1,Tail), Tail = [F1 | [F2 | _]], Fib is F1 + F2.

bifib(N,Fib) :- bifibList(N,[Fib|_]).
bifibList(0,[0]).
bifibList(1,[1,0]).
bifibList(N,[Fib|Tail]) :- N #># 0, N1 #=# N-1, bifibList(N1,Tail), Tail = [F1 | [F2 | _]], Fib #=# F1 + F2.