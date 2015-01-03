-module(mergesort).
-export([mergesort/2]).

% CALLS TO WRAPPER FUNCTION

% mergesort used when there is actually only one list passed
% splits into two lists and calls general mergesort
mergesort(List) ->
	% I used this before I realised I could
	% just use lists:sort() to return the list
	% Splitpoint = length(List) div 2,
	% {Left, Right} = lists:split(Splitpoint, List),
    % mergesort(Left, Right).
	lists:sort(List).

% merge sorting two empty list is just an empty list
mergesort([], []) -> [];

% merge with only one list
% split list into two and call merge
mergesort(Left, []) ->
	mergesort(Left);

mergesort([], Right) ->
	mergesort(Right);

% merge sort with two full lists
% before merging sort the lists into 
% ascending order (Keep getting order issues without this!)
mergesort(Left, Right) -> 
	Sortedleft = lists:sort(Left),
	Sortedright = lists:sort(Right),
	merge(Sortedleft, Sortedright, []).

% ACTUAL WRAPPER FUNCTION

% terminating case when all elements have been sorted
merge([], [], List) -> lists:reverse(List);
	
% No Right list left
merge([L|Left], [], List) ->
	merge(Left, [], [L|List]);

% No Left list left
merge([], [R|Right], List) ->
	merge([], Right, [R|List]);

% General recursive case 1
% if the Right head is less than the left
% add it to our sorted list and remove it
% from the original list
merge([L|Left], [R|Right], List) when R < L -> 
    merge([L|Left], Right, [R|List]);

% General recursive case 2
% If we are in this case then the 
% right head isn't less than and no guard
% is required because we know we can just
% add it to the list
merge([L|Left], Right, List) -> 
	merge(Left, Right, [L|List]).
	



	


