#!/usr/bin/env mix-snippet
#
# mix run snippets/<this_file>.exs

IO.puts "Waiting..."
receive do
  :this_will_never_arrive -> :ok
after
  1000 -> :timedout
end
|> IO.puts

