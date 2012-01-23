sodoku(P,S) :- P = S, 
P = [A1,A2,A3,A4,
B1,B2,B3,B4,
C1,C2,C3,C4,
D1,D2,D3,D4],
fd_domain(P,1,4),
Row1=[A1,A2,A3,A4],
Row2=[B1,B2,B3,B4],
Row3=[C1,C2,C3,C4],
Row4=[D1,D2,D3,D4],
Col1=[A1,B1,C1,D1],
Col2=[A2,B2,C2,D2],
Col3=[A3,B3,C3,D3],
Col4=[A4,B4,C4,D4],
Sq1=[A1,A2,B1,B2],
Sq2=[A3,A4,B3,B4],
Sq3=[C1,C2,D1,D2],
Sq4=[C3,C4,D3,D4],
valid([Row1,Row2,Row3,Row4,Col1,Col2,Col3,Col4,Sq1,Sq2,Sq3,Sq4]),
printboard(P).


s3(P,S) :- 
P = S,
fd_domain(P,1,9),
length(P,81),
rows(P,9,Rows),
columns(P,[0,1,2,3,4,5,6,7,8] ,Cols),
squares9(P,[0,3,6, 
  27,30,33,
  54,57,63],Squares),
valid(Rows),
valid(Squares),
valid(Cols),
printboard9(P).



s2(P,S) :- 
P = S,
fd_domain(P,1,4),
length(P,16),
rows(P,4,Rows),
columns(P,[0,1,2,3] ,Cols),
squares(P,[0,2,8,10],Squares),
valid(Rows),
valid(Squares),
valid(Cols),
printboard(P).


%s2f(Name,S) :- 
%readArray(Name,P), s2(P,S).

%s3f(Name,S) :- 
%readArray(Name,P), s2(P,S).

%% doesn't work -- I don't know how to init the unknowns from a file
%readArray(Name,Arr) :-
%    seeing(Old),
%    see(Name),
%    readArray(Arr),
%    seen,
%    see(Old).
%
%readArray([X|Tail]) :-
%    read(X),
%    X \= end-of-file,
%    readArray(Tail).
    




peelOff(X,Len,B):- append(A,B,X), length(A,Len).
peelOff(X,Len,A,B):- append(A,B,X), length(A,Len).

%rows([],[]).
%rows([A,B,C,D|Tail],[[A,B,C,D]|NewTail]) :- rows(Tail,NewTail).

rows(P,Count,Out):- chunk(P,Count,Out).

fourOdd([],[]).
fourOdd([A,_,_,_|Tail],[A|NewTail]) :- fourOdd(Tail,NewTail).
fourOdd([A,_,_],[A]).
fourOdd([A,_],[A]).
fourOdd([A],[A]).

%%%
%
%   not working. I think the bug is is Xodd - - could be in Columns9
%
%%%

xOdd(List,X,[Out|NewTail]):- peelOff(List,Len,[Out|_],Tail), xOdd(Tail,X,NewTail).

chunk([],_,[]).
chunk(Full,ChunkSize,[Col|NewTail]) :- 
    peelOff(Full,ChunkSize,Col,Tail),
    chunk(Tail,ChunkSize,NewTail).

item(Full,Index,X) :- peelOff(Full,Index,Tail), Tail = [X|_].

count(X,[X|NewTail]):- X > 0, X1 is X-1, count(X1,NewTail).
count(0,[]).


columns(_,[],_).
columns(Puzzle,[Counter|CounterTail],[Col|NewTail]):-
    peelOff(Puzzle,Counter,Shifted),
    fourOdd(Shifted,Col),
    columns(Puzzle,CounterTail,NewTail).

squares(_,[],_).
squares(Puzzle,[Counter|CounterTail],[Square|NewTail]):-
    peelOff(Puzzle,Counter,Shifted),
    square(Shifted,Square),
    squares(Puzzle,CounterTail,NewTail).


columns9(_,[],_).
columns9(Puzzle,[Counter|CounterTail],[Col|NewTail]):-
peelOff(Puzzle,Counter,Shifted),
xOdd(Shifted,9,Col),
columns9(Puzzle,CounterTail,NewTail).

squares9(_,[],_).
squares9(Puzzle,[Counter|CounterTail],[Square|NewTail]):-
    peelOff(Puzzle,Counter,Shifted),
    square9(Shifted,Square),
squares9(Puzzle,CounterTail,NewTail).

square([A,B,_,_,C,D|_],[A,B,C,D]).

square9(X,MySquare):-
    chunk(X,3,[R1,_,_,R2,_,_,R3|_]),
    append(R1,R2,TwoLines),
    append(TwoLines,R3,MySquare).

valid([]).
valid([H|T]) :- fd_all_different(H),valid(T).

%printline([]).
printline(X) :- print(X), print('\n').
%printline([H|T]) :- prin(H), printline(T).

printboard([]).
printboard([A,B,C,D|T]) :- printline([A,B,C,D]), printboard(T).

printboardX(Board,X):-
   chunk(Board,X,SubRows),
chunk(SubRows,X,Rows),
    chunk(Rows,X,Slices),
    printSlices(Slices).

testBreak:-
    count(81,X),
    printboardX(X,3).

printSlices([]).
printSlices([Slice|Tail]):- 
    printSlice(Slice), 
    print('\n'), 
    printSlices(Tail).

printSlice([]).
printSlice([Line|Tail]):- print(Line), print('\n'),printSlice(Tail).

testRows(X):-
    count(81,Y),
    rows(Y,9,X).

testCols(X):- 
    count(81,P),
    columns9(P,[0,1,2,3,4,5,6,7,8] ,X).

