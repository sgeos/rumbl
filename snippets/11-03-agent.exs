#!/usr/bin/env mix-snippet
#
# mix run snippets/11-02-genserver.exs

defmodule Utility do
  def print_value(value, prompt) do
    IO.puts("#{prompt}#{value}")
  end
end

import Agent
{:ok, agent} = start_link fn -> 5 end
get(agent, &(&1)) |> Utility.print_value("get agent &(&1) -> ")
update(agent, &(&1 + 1))
get(agent, &(&1)) |> Utility.print_value("get agent &(&1) -> ")
get_and_update(agent, &({&1-1, &1-1})) |> Utility.print_value("get_and_update agent, &({&1-1, &1-1}) -> ")
stop agent

