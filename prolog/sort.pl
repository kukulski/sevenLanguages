insert_sort(List,Sorted):-isort(List,[],Sorted).

isort([],Acc,Acc).
isort([H|T],Acc,Sorted):-insert(H,Acc,Nacc),isort(T,Nacc,Sorted).

insert(X,[Y|T],[Y|NT]):-  X>Y ,insert(X,T,NT).
insert(X,[Y|T],[X,Y|T]):-X=<Y.
insert(X,[],[X]).




rva([X|T],Acc,Result) :- rva(T,[X|Acc],Result). 
rva([],Acc,Acc).
rva(X,Result) :- rva(X,[],Result).

smallest(X,[X]).
smallest(Head, [Head|T]) :- smallest(PreviousBest, T), Head < PreviousBest.
smallest(Head, [Head|T]) :- smallest(PreviousBest, T), Head = PreviousBest.
smallest(PreviousBest, [Head|T]) :- smallest(PreviousBest, T), Head > PreviousBest.




