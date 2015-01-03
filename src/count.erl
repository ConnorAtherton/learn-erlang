-module(count).
-export([countodd/1]).

% empty list has a count of the current value
count_tail([], Count) -> Count;

% recursive case. Incremenets count if
% it finds an odd number.
count_tail([Head|Tail], Count) -> 
	if
		Head rem 2 == 1 -> count_tail(Tail, Count + 1);
		Head rem 2 == 0 -> count_tail(Tail, Count)
	end.

% wrapper
countodd(List) -> count_tail(List, 0).
