
sudoku1([
  [_, _, _, _, _, 1, 2, 3, _],
  [1, 2, 3, _, _, 8, _, 4, _],
  [8, _, 4, _, _, 7, 6, 5, _],
  [7, 6, 5, _, _, _, _, _, _],
  [_, _, _, _, _, _, _, _, _],
  [_, _, _, _, _, _, 1, 2, 3],
  [_, 1, 2, 3, _, _, 8, _, 4],
  [_, 8, _, 4, _, _, 7, 6, 5],
  [_, 7, 6, 5, _, _, _, _, _]
]).

sudoku2([
  [_, _, _, 2, 6, _, 7, _, 1],
  [6, 8, _, _, 7, _, _, 9, _],
  [1, 9, _, _, _, 4, 5, _, _],
  [8, 2, _, 1, _, _, _, 4, _],
  [_, _, 4, 6, _, 2, 9, _, _],
  [_, 5, _, _, _, 3, _, 2, 8],
  [_, _, 9, 3, _, _, _, 7, 4],
  [_, 4, _, _, 5, _, _, 3, 6],
  [7, _, 3, _, 1, 8, _, _, _]
]).

%% Predicate to show a Sudoku in the screen.
show([X0, X1, X2, X3, X4, X5, X6, X7, X8]) :-
  write("+---+---+---+\n"),
  showRow(X0), showRow(X1), showRow(X2),
  write("+---+---+---+\n"),
  showRow(X3), showRow(X4), showRow(X5),
  write("+---+---+---+\n"),
  showRow(X6), showRow(X7), showRow(X8),
  write("+---+---+---+\n\n\n").
showRow([X0, X1, X2, X3, X4, X5, X6, X7, X8]) :-
  write("|"),
  showEntry(X0), showEntry(X1), showEntry(X2),
  write("|"),
  showEntry(X3), showEntry(X4), showEntry(X5),
  write("|"),
  showEntry(X6), showEntry(X7), showEntry(X8),
  write("|\n").
showEntry(X) :- var(X), write(" ").
showEntry(X) :- nonvar(X), write(X).

% Exe5
% (a)
isDigit(X) :-
	between(1, 9, X).

% (b)
isElement(X) :-
	var(X).
isElement(X) :-
	nonvar(X),
	isDigit(X).

% (c)
emptyRow(Row) :-
	length(Row, 9).

emptySudoku(Sudoku) :-
	length(Sudoku, 9),
	maplist(emptyRow, Sudoku).

% (d)
isValidRow(Row) :-
	length(Row, 9),
	maplist(isElement, Row).
  
isSudokuPuzzle(Sudoku) :-
	length(Sudoku, 9),
	%长度要验证吗
	maplist(isValidRow, Sudoku).

% Exe6
% (a)
findPositionOfRow([Entry|Subrow], 0, Entry).
findPositionOfRow([_|Subrow], J, Entry) :-
	J >= 0,
	J < 9,
	J1 is J - 1,
	length(Subrow, L),
	L >= J1,
	findPositionOfRow(Subrow, J1, Entry).

entry(Sudoku, I, J, Entry) :-
	row(Sudoku, I, Row),
	findPositionOfRow(Row, J, Entry).

% (B)
row([Row|_], 0, Row).
row([_|Submatrix], I, Row) :-
	I >= 0,
	I < 9,
	I1 is I - 1,
	length(Submatrix, L),
	L >= I1,
	row(Submatrix, I1, Row).

% (C)
getColumnOfRows(Sudoku, 8, J, [Entry]) :-
	entry(Sudoku, 8, J, Entry).

getColumnOfRows(Sudoku, I, J, [Entry|Subcolumn]):-
	I >= 0,
	I < 9,
	J >= 0,
	J < 9,
	I1 is I + 1,
	entry(Sudoku, I, J, Entry),
	getColumnOfRows(Sudoku, I1, J, Subcolumn).
column(Sudoku, J, Column) :-
	getColumnOfRows(Sudoku, 0, J, Column).

% (D)
getSquareFrom(Sudoku, Pi, Pj, [X0, X1, X2, X3, X4, X5, X6, X7, X8]):-
	Pi1 is Pi + 1,
	Pi2 is Pi + 2,
	Pj1 is Pj + 1,
	Pj2 is Pj + 2,
	entry(Sudoku, Pi, Pj, X0),
	entry(Sudoku, Pi, Pj1, X1),
	entry(Sudoku, Pi, Pj2, X2),
	entry(Sudoku, Pi1, Pj, X3),
	entry(Sudoku, Pi1, Pj1, X4),
	entry(Sudoku, Pi1, Pj2, X5),
	entry(Sudoku, Pi2, Pj, X6),
	entry(Sudoku, Pi2, Pj1, X7),
	entry(Sudoku, Pi2, Pj2, X8).

square(Sudoku, K, Square):-
	Pi is (K//3)*3,
	Pj is (K mod 3)*3,
	getSquareFrom(Sudoku, Pi, Pj, Square).

% exe7
checkDuplicates(_,[]).
checkDuplicates(X,[Y|Sublist]) :-
	X \= Y,
	checkDuplicates(X,Sublist).
withoutDuplicates([]).
withoutDuplicates([X|Sublist]) :-
	var(X),
	checkDuplicates(X,Sublist),
	withoutDuplicates(Sublist).
withoutDuplicates([X|Sublist]) :-
	nonvar(X),
	withoutDuplicates(Sublist).

