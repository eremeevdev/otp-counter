- module(counter_sup).
- export([start/1, init/1]).
- behavior(supervisor).

start(Arguments) ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, Arguments).

init(Arguments) ->
	ChildSpec = {counter, {counter, start_link, [Arguments]}, permanent, 2000, worker, [counter]},
	SupSpec = {one_for_one, 10, 10},
	{ok, {SupSpec, [ChildSpec]}}.
