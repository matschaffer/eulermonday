-module(dscleaver).
-export([euler11/0, euler11/1]).

% Solve the matrix problem for any matrix. Process horizontal, vertical, 
% and diagonal in parallel and then wait on the results.
euler11(Matrix) ->
	processHorizontal(Matrix),
	processVertical(Matrix),
	processDiagonal(Matrix),
	receiveMaxProducts(3, 0).

% Spawn the horizontal search
processHorizontal(Matrix) ->
	spawnMaxProduct(fun() -> maxProductOfLists(Matrix) end).

% Spawn the vertical search
processVertical(Matrix) ->
	spawnMaxProduct(fun() -> maxVerticalProduct(Matrix) end).

% Spawn the diagonal search
processDiagonal(Matrix) ->
	spawnMaxProduct(fun() -> maxDiagonalProduct(Matrix) end).

% Spawns a diagonal search first on all diagonals running down to the 
% left, then reverses the list of lists to get all diagonals running to
% the right. Accumulate the results of each search.
maxDiagonalProduct(Matrix) ->
	Spawned1 = spawnDiagonalSearches(Matrix),
	Spawned2 = spawnDiagonalSearches(lists:reverse(Matrix)),
	receiveMaxProducts(Spawned1 + Spawned2, 0).

% Assuming a list of lists, we start with the first list and 
% keep the rest in reserve. 
spawnDiagonalSearches([First|Rest]) ->
	spawnDiagonalSearches([First], Rest, 0).

% Each diagonal is constructed from
% the head of each list in the first argument, then a list is 
% added from the second argument if any remain.
%
% Example: [[a, b, c]] [[d, e, f], [g, h, i]] -> spawn search on [a]
%          [[b, c], [d, e, f]] [[g, h, i]]    -> spawn search on [b, d]
%          [[c], [e, f], [g, h, i]] []        -> spawn search on [c, e, g]
%          [[f], [h, i]] []                   -> spawn search on [f, h]
%          [[i]] []                           -> spawn search on [i]
spawnDiagonalSearches([], _, Spawned) ->
	Spawned;
spawnDiagonalSearches(Lists, [], Spawned) ->
	{Diagonal, Leftover} = stripOffFront(Lists),
	spawnMaxProduct(fun() -> maxProductOfList(Diagonal) end),
	spawnDiagonalSearches(Leftover, [], Spawned + 1);
spawnDiagonalSearches(Lists, [Next|Rest], Spawned) ->
	{Diagonal, Leftover} = stripOffFront(Lists),
	spawnMaxProduct(fun() -> maxProductOfList(Diagonal) end),
	spawnDiagonalSearches([Next|Leftover], Rest, Spawned + 1).

% Spawn all searches on the verticals in the matrix.
% Accumulate all results.
maxVerticalProduct(Matrix) ->
	Spawned = spawnVerticalSearches(Matrix, 0),
	receiveMaxProducts(Spawned, 0).

% Strip the front off of each list to produce the vertical list.
%
% Example: [[a, b, c], [d, e, f], [g, h, i]] -> spawn search on [a, d, g]
%          [[b, c], [e, f], [h, i]]          -> spawn search on [b, e, h]
%          [[c], [f], [i]]                   -> spawn search on [c, f, i]
spawnVerticalSearches([], Spawned) ->
	Spawned;
spawnVerticalSearches(Lists, Spawned) ->
	{Vertical, Leftover} = stripOffFront(Lists),
	spawnMaxProduct(fun() -> maxProductOfList(Vertical) end),
	spawnVerticalSearches(Leftover, Spawned + 1).

% Strips the first element off of each list, and returns a result list
% that excludes now empty lists.
stripOffFront([]) ->
	{[], []};
stripOffFront([[Start]|Rest]) ->
	{Vertical, Remaining} = stripOffFront(Rest),
	{[Start|Vertical], Remaining};
stripOffFront([[Start|List1]|Rest]) ->
	{Vertical, Remaining} = stripOffFront(Rest),
	{[Start|Vertical], [List1|Remaining]}.

% Spawns a search on each list in the list and then accumulates the results
maxProductOfLists(Lists) ->
	Spawned = spawnProductOfLists(Lists, 0),
	receiveMaxProducts(Spawned, 0).

% Spawn a search on each list.
spawnProductOfLists([], Spawned) ->
	Spawned;
spawnProductOfLists([Head | Rest], Spawned) ->
	spawnMaxProduct(fun() -> maxProductOfList(Head) end),
	spawnProductOfLists(Rest, Spawned + 1).

% Receives a certain number of messages from max value and calculates the
% maximum of all messages recieved.
receiveMaxProducts(0, Max) ->
	Max;
receiveMaxProducts(Spawned, Max) ->
	receive
		{max, Value} ->
			receiveMaxProducts(Spawned - 1, max(Max, Value))
	end.

% Spawns a max product function. This utility method handles sending the
% result of the function back to the parent process.
spawnMaxProduct(Fun) ->
	Pid = self(),
	spawn_link(fun() ->
				Max = Fun(),
				Pid!{max, Max}
		end).

% Calculate the max product of four consecutive values in a given list.
maxProductOfList(List) ->
	maxProductOfList(List, 0).

% If there are four consecutive values, calculate their product and compare
% to the current maximum. Then call recursively with all but the head of the
% list. Stop when there aren't more than four values.
maxProductOfList([A,B,C,D|Rest], CurrentMax) ->
	Product = A * B * C * D,
	maxProductOfList([B,C,D|Rest], max(CurrentMax, Product));
maxProductOfList(_List, Max) ->
	Max.

% Calculate a maximum. Does erlang have this built in somewhere? Probably,
% but I didn't look.
max(A, B) when A > B ->
	A;
max(_A, B) ->
	B.

% Solve the problem.
euler11() -> euler11([
[08, 02, 22, 97, 38, 15, 00, 40, 00, 75, 04, 05, 07, 78, 52, 12, 50, 77, 91, 08],
[49, 49, 99, 40, 17, 81, 18, 57, 60, 87, 17, 40, 98, 43, 69, 48, 04, 56, 62, 00],
[81, 49, 31, 73, 55, 79, 14, 29, 93, 71, 40, 67, 53, 88, 30, 03, 49, 13, 36, 65],
[52, 70, 95, 23, 04, 60, 11, 42, 69, 24, 68, 56, 01, 32, 56, 71, 37, 02, 36, 91],
[22, 31, 16, 71, 51, 67, 63, 89, 41, 92, 36, 54, 22, 40, 40, 28, 66, 33, 13, 80],
[24, 47, 32, 60, 99, 03, 45, 02, 44, 75, 33, 53, 78, 36, 84, 20, 35, 17, 12, 50],
[32, 98, 81, 28, 64, 23, 67, 10, 26, 38, 40, 67, 59, 54, 70, 66, 18, 38, 64, 70],
[67, 26, 20, 68, 02, 62, 12, 20, 95, 63, 94, 39, 63, 08, 40, 91, 66, 49, 94, 21],
[24, 55, 58, 05, 66, 73, 99, 26, 97, 17, 78, 78, 96, 83, 14, 88, 34, 89, 63, 72],
[21, 36, 23, 09, 75, 00, 76, 44, 20, 45, 35, 14, 00, 61, 33, 97, 34, 31, 33, 95],
[78, 17, 53, 28, 22, 75, 31, 67, 15, 94, 03, 80, 04, 62, 16, 14, 09, 53, 56, 92],
[16, 39, 05, 42, 96, 35, 31, 47, 55, 58, 88, 24, 00, 17, 54, 24, 36, 29, 85, 57],
[86, 56, 00, 48, 35, 71, 89, 07, 05, 44, 44, 37, 44, 60, 21, 58, 51, 54, 17, 58],
[19, 80, 81, 68, 05, 94, 47, 69, 28, 73, 92, 13, 86, 52, 17, 77, 04, 89, 55, 40],
[04, 52, 08, 83, 97, 35, 99, 16, 07, 97, 57, 32, 16, 26, 26, 79, 33, 27, 98, 66],
[88, 36, 68, 87, 57, 62, 20, 72, 03, 46, 33, 67, 46, 55, 12, 32, 63, 93, 53, 69],
[04, 42, 16, 73, 38, 25, 39, 11, 24, 94, 72, 18, 08, 46, 29, 32, 40, 62, 76, 36],
[20, 69, 36, 41, 72, 30, 23, 88, 34, 62, 99, 69, 82, 67, 59, 85, 74, 04, 36, 16],
[20, 73, 35, 29, 78, 31, 90, 01, 74, 31, 49, 71, 48, 86, 81, 16, 23, 57, 05, 54],
[01, 70, 54, 71, 83, 51, 54, 69, 16, 92, 33, 48, 61, 43, 52, 01, 89, 19, 67, 48]
			
		]).
