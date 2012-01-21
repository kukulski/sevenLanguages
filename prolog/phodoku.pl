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


s2(P,S) :- 
P = S,
fd_domain(P,1,4),
length(P,16),
r4(P,Rows),
columns(P,[0,1,2,3] ,Cols),
squares(P,[0,2,8,10],Squares),
valid(Rows),
valid(Squares),
valid(Cols),
printboard(P).


r2([],[]).
r2([A,B|Tail],[[A,B]|NewTail]) :- r2(Tail,NewTail).

r4([],[]).
r4([A,B,C,D|Tail],[[A,B,C,D]|NewTail]) :- r4(Tail,NewTail).


peelOff(X,Len,B):- append(A,B,X), length(A,Len).




odd([],[]).
odd([A,_|Tail],[A|NewTail]) :- odd(Tail,NewTail).
odd([A],[A]).


c4([A,B,C|Tail],[AS,BS,CS,DS]) :- 
    fourOdd([A,B,C|Tail],AS),
    fourOdd([B,C|Tail],BS),
    fourOdd([C|Tail],CS),
    fourOdd(Tail,DS).



columns(_,[],_).
columns(Puzzle,[Counter|CounterTail],[Col|NewTail]):-
    peelOff(Puzzle,Counter,Shifted),
    fourOdd(Shifted,Col),
    columns(Puzzle,CounterTail,NewTail).

squares(_,[],_).
squares(Puzzle,[Counter|CounterTail],[Square|NewTail]):-
    peelOff(Puzzle,Counter,Shifted),
    square(Shifted,Square),
    columns(Puzzle,CounterTail,NewTail).

square([A,B,_,_,C,D|_],[A,B,C,D]).



c2([],[]).
c2([A|Tail],[Col|NewTail]) :- fourOdd([A|Tail],Col), c2(Tail,NewTail), length(Tail,15).
c2([A|Tail],[Col|NewTail]) :- fourOdd([A|Tail],Col), c2(Tail,NewTail), length(Tail,14).
c2([A|Tail],[Col|NewTail]) :- fourOdd([A|Tail],Col), c2(Tail,NewTail), length(Tail,13).
c2([A|Tail],[Col|NewTail]) :- fourOdd([A|Tail],Col), c2(Tail,NewTail), length(Tail,12).


threeOdd([],[]).
threeOdd([A,_,_|Tail],[A|NewTail]) :- threeOdd(Tail,NewTail).
threeOdd([A,_],[A]).
threeOdd([A],[A]).

fourOdd([],[]).
fourOdd([A,_,_,_|Tail],[A|NewTail]) :- fourOdd(Tail,NewTail).
fourOdd([A,_,_],[A]).
fourOdd([A,_],[A]).
fourOdd([A],[A]).









%rows([A,B,C,D,E,F,G,H,I|Tail],[],Rows) := 


%s9(P,S) := P = S,




valid([]).
valid([H|T]) :- fd_all_different(H),valid(T).

%printline([]).
printline(X) :- print(X), print('\n').
%printline([H|T]) :- prin(H), printline(T).

printboard([]).
printboard([A,B,C,D|T]) :- printline([A,B,C,D]), printboard(T).
