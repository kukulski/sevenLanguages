valid_queen((_,C)) :- member(C,[1,2,3,4,5,6,7,8]).

valid_board([]).
valid_board([H|T]) :- valid_queen(H), valid_board(T).

cols([],[]).
cols([(_,Col)|QT],[Col|CT]) :- cols(QT,CT).

diags1([],[]).
diags1([(Row,Col)|QueensTail],[Diagonal|DiagonalsTail]) :-
    Diagonal is Col - Row,
    diags1(QueensTail,DiagonalsTail).


diags2([],[]).
diags2([(Row,Col)|QueensTail],[Diagonal|DiagonalsTail]) :-
    Diagonal is Col + Row,
    diags2(QueensTail,DiagonalsTail).

allDifferent([]).
allDifferent([H|T]) :- fd_all_different(H),alldifferent(T).


eight_queens(Board) :- 
    Board=[(1,_),(2,_),(3,_),(4,_),(5,_),(6,_),(7,_),(8,_)],
    valid_board(Board),
    
    cols(Board,Cols), 
    diags1(Board,Diags1),
    diags2(Board,Diags2),

    allDifferent([Cols,Diags1,Diags2]).
%fd_all_different(Cols), fd_all_different(Diags1), fd_all_different(Diags2).
%.



