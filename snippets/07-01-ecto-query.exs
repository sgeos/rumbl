#!/usr/bin/env elixir

import Ecto.Query
alias Rumbl.Repo
alias Rumbl.User

# correct
username="bsechter"
Repo.one(from u in User, where: u.username == ^username)

# incorrect
username=123
Repo.all(from u in User, where: u.username == ^username)

