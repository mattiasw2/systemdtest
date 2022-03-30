%%%-------------------------------------------------------------------
%% @doc systemdtest public API
%% @end
%%%-------------------------------------------------------------------

-module(systemdtest_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    lager:info("systemdtest_app started"),
    systemd:notify(ready),
    systemdtest_sup:start_link().

stop(_State) ->
    lager:info("systemdtest_app stopped"),
    ok.

%% internal functions
