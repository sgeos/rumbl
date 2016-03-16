#!/usr/bin/env mix-snippet
#
# mix run snippets/11-02-genserver.exs

import Agent
{:ok, agent} = start_link fn -> 5 end, name: MyAgent
{:ok, agent} = start_link fn -> 5 end, name: MyAgent

