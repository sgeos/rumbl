#!/usr/bin/env elixir

alias Rumbl.Category
alias Rumbl.Video
alias Rumbl.Repo
import Ecto.Query

# works
category = Repo.get_by Category, name: "Music"
video = Repo.one(from v in Video, limit: 1)
changeset = Video.changeset(video, %{category_id: category.id})
Repo.update(changeset)

# fails
changeset = Video.changeset(video, %{category_id: :bad_category_id})
{:error, changeset} = Repo.update(changeset)
changeset.errors

