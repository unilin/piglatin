-module(piglatin).
-compile(export_all).


reverse(List) -> reverse(List, []).
reverse([], Acc) -> Acc;
reverse([H|T], Acc) -> reverse(T, [H|Acc]).

%"hello world" ==== ["h","e","l","l","o", " ", "w", "o", "r", "l", "d"]
% ["hello", "world"] = [["h","e","l","l","o"], ["w", "o", "r", "l", "d"]

translate(List) -> translate(List, [], []).

translate([], [], Acc) ->  combine_it(reverse(Acc));% ["ellohey", "orldwey"]
translate([], Acc1, Acc2) -> translate([], [], [pig_it(reverse(Acc1))|Acc2]);
translate([$\s|T], Acc1, Acc2) -> translate(T, [], [$\s, pig_it(reverse(Acc1)) | Acc2]);
translate([H|T], Acc1, Acc2) -> translate(T, [H|Acc1], Acc2).

pig_it([H|T]) -> T ++ [H] ++ "ay".

combine_it(List) -> combine_it(List, []).

combine_it([], Acc) -> reverse(Acc);

combine_it([[]|T], Acc) -> combine_it(T, Acc);
combine_it([[H1|T1]|T], Acc) -> combine_it([T1|T], [H1|Acc]);
combine_it([H|T], Acc) -> combine_it(T, [H|Acc]).
