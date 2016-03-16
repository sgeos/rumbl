#!/usr/bin/env mix-snippet
#
# mix run snippets/11-06-wolfram.exs

defmodule Utility do
  def query(question) do
    InfoSys.compute(question)
    |> respond(question)
  end

  def respond([], question) do
    respond([%{text: "No response."}], question)
  end

  def respond([%{text: answer}], question) do
    IO.puts ""
    IO.puts "--- #{question} ---"
    IO.puts "#{answer}"
    answer
  end
end

Utility.query("What is elixir?")
Utility.query("What is the meaning of life?")

