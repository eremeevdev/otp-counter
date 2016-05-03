- module(counter).
- export([inc/0, inc/1, dec/0, dec/1, get/0, start_link/1, stop/0, terminate/2]).
- export([init/1, handle_call/3]).
- behavior(gen_server).


%% callback functions

init(Count) ->
	io:format("init!~n"),
	{ok, Count}.

handle_call({inc, Value}, _From, LoopData) ->
	Count = LoopData + Value,
	{reply, Count, Count};

handle_call({dec, Value}, _From, LoopData) ->
	Count = LoopData - Value,
	{reply, Count, Count};

handle_call(get, _From, LoopData) ->
	{reply, LoopData, LoopData};

handle_call(stop, _From, LoopData) ->
	{stop, reason, reply, LoopData}.

terminate(Reason, LoopData) ->
	io:format("Terminate! ~p~n", [Reason]),
	ok.

%% control functions

start_link(InitialValue) ->
	gen_server:start_link({local, ?MODULE}, ?MODULE, InitialValue, []).

stop() ->
	gen_server:call(?MODULE, stop).

inc(Value) ->
	gen_server:call(?MODULE, {inc, Value}).

inc() ->
	inc(1).
	
dec(Value) ->
	gen_server:call(?MODULE, {dec, Value}).

dec() ->
	dec(1).

get() ->
	gen_server:call(?MODULE, get).
