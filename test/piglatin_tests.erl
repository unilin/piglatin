-module(piglatin_tests).
-include_lib("eunit/include/eunit.hrl").

pinglatin_test() ->
    ?assertEqual("ellohay", piglatin:translate("hello")),
    ?assertEqual("orldway", piglatin:translate("world")),
    ?assertEqual("ellohay orldway", piglatin:translate("hello world")).
