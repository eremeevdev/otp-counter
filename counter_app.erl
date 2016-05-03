- module(counter_app).
- behavior(application).
- export([start/2, stop/1]).

start(_StartType, Arguments) ->
	counter_sup:start_link(Arguments).

stop(_State) ->
	ok.
