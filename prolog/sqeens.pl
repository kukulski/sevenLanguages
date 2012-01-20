
valid_queen((R,C)) :- Range = [1,2,3,4,5,6,7,8], member(R,Range), member(C,Range).

valid_board([]).
valid_board([H|T]) :- valid_queen(H), valid_board(T).

rows([],[]).
rows([(Row,_)|QueensTail],[Row|RowsTail]) : - 
rows(QueensTail,RowsTail).

cols([],[]).
cols([(_,Col)|QueensTail],[Col|ColsTail]) : - 
cols(QueensTail,ColsTail).

diags1([],[]).
diags1([(Row,Col)|QueensTail],[Diagonal|DiagonalsTail]) :-
    Diagonal is Col - Row,
    diags1(QueensTail,DiagonalsTail).


diags2([],[]).
diags2([(Row,Col)|QueensTail],[Diagonal|DiagonalsTail]) :-
Diagonal is Col + Row,
diags2(QueensTail,DiagonalsTail).

alldifferent([]).
alldifferent([H|T]) :- fd_all_different(H),alldifferent(T).


eight_queens(Board) :- 
    length(Board,8),
    valid_board(Board),
    
    rows(Board, Rows), cols(Board,Cols), diags1(Board,Diags1),diags2(Board,Diags2),
    allDifferent([Rows,Cols,Diags1,Diags2]).



