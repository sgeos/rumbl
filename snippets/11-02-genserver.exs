#!/usr/bin/env mix-snippet
#
# mix run snippets/11-02-genserver.exs

defmodule Utility do
  def print_value(value, prompt) do
    IO.puts("#{prompt}#{value}")
  end
end

alias Rumbl.Counter
{:ok, counter} = Counter.start_link(10)
Counter.val(counter) |> Utility.print_value("Counter.val(counter): ")
Counter.dec(counter)
Counter.dec(counter)
Counter.val(counter) |> Utility.print_value("Counter.val(counter): ")
Counter.inc(counter)
Counter.val(counter) |> Utility.print_value("Counter.val(counter): ")

