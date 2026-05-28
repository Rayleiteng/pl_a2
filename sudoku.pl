
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
  [7, _, 3, _, 1, 8, _, _, _],
]).

%% Predicate to show a Sudoku in the screen.
show([X0, X1, X2, X3, X4, X5, X6, X7, X8]) :-
  write("+---+---+---+\n"),
  showRow(X0), showRow(X1), showRow(X2),
  write("+---+---+---+\n"),
  showRow(X3), showRow(X4), showRow(X5),
  write("+---+---+---+\n"),
  showRow(X7), showRow(X8), showRow(X9),
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
