#!/usr/bin/env mix-snippet
#
# mix run snippets/11-01-counter.exs

alias Rumbl.Counter

defmodule Utility do
  def print_value(value, prompt) do
    IO.puts("#{prompt}#{value}")
  end
end

{:ok, counter} = Counter.start_link(0)
Counter.inc(counter)
Counter.inc(counter)
Counter.val(counter) |> Utility.print_value("Counter: ")
Counter.dec(counter)
Counter.val(counter) |> Utility.print_value("Counter: ")

