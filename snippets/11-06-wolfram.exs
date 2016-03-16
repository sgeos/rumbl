#!/usr/bin/env mix-snippet
#
# mix run snippets/11-06-wolfram.exs

defmodule Utility do
  def query(question) do
    [answer] = Rumbl.InfoSys.compute(question)
    IO.puts ""
    IO.puts "--- #{question} ---"
    IO.puts "#{answer.text}"
  end
end

Utility.query("What is elixir?")
Utility.query("What is the meaning of life?")

