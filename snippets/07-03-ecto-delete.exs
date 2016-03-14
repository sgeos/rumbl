#!/usr/bin/env mix-snippet

alias Rumbl.Repo
import Ecto.Changeset

# contraint error
category = Repo.get_by Category, name: "Music"
Repo.delete category

#
changeset =
  category
  |> Ecto.Changeset.change()
  |> foreign_key_constraint(:videos, name:
       :videos_category_id_fkey, message: "still exist")
{:error, changeset} = Repo.delete changeset

