#!/usr/bin/env mix-snippet
#
# mix run priv/repo/backend_seeds.exs

alias Rumbl.Repo
alias Rumbl.User

Repo.insert!(%User{name: "Wolfram", username: "wolfram"})

