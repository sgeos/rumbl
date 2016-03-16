#!/usr/bin/env mix-snippet
#
# mix run snippets/11-06-wolfram.exs

pid = spawn(fn -> :ok end)
Process.monitor(pid)

receive do          
  {status, _ref, result} ->
    IO.puts "Status: #{status}"
    IO.puts "Result: #{result}"
  {status, _ref, :process, _pid, reason} ->
    IO.puts "Status: #{status}"
    IO.puts "Reason: #{reason}"
end

