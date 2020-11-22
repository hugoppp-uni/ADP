%%%-------------------------------------------------------------------
%%% @author Justin Hoffmann
%%% @author Hugo Protsch
%%%-------------------------------------------------------------------
-module(sortAnalyse).
-author("Justin Hoffmann").
-author("Hugo Protsch").

%% API
-export([]).

-include_lib("eunit/include/eunit.hrl").

test_test() ->
  ?assertEqual(0, analyze(fun qsortLeft/1, 50, 100111)).


analyze(Function, Count, Length) ->
  TimeAll = lists:map(
    fun(L) ->
      {Time, _} = timer:tc(Function, [L]),
      Time
    end, randomLists(Count, Length, 9999999)),
  lists:sum(TimeAll) div Count
.

switchNumber() -> 0.

qsortLeft(L) ->
  sort:qsort(left, L, switchNumber()).

qsortRight(L) ->
  sort:qsort(right, L, switchNumber()).

qsortMedian(L) ->
  sort:qsort(median, L, switchNumber()).

qsortMiddle(L) ->
  sort:qsort(middle, L, switchNumber()).

qsortRandom(L) ->
  sort:qsort(random, L, switchNumber()).


randomLists(Count, Length, MaxInt) ->
  randomLists(Length, Count, MaxInt, []).

randomLists(0, _Length, _MaxInt, Acc) -> Acc;
randomLists(Count, Length, MaxInt, Acc) ->
  randomLists(Count - 1, Length, MaxInt, [randomList(Length, MaxInt) | Acc]).


randomList(Length, MaxInt) ->
  random:seed(erlang:now()),
  randomList(Length, MaxInt, []).

randomList(0, MaxInt, Acc) -> Acc;
randomList(Length, MaxInt, Acc) ->
  randomList(Length - 1, MaxInt, [random:uniform(MaxInt) | Acc]).