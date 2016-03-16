defmodule Rumbl.UserRepoTest do
  use Rumbl.ModelCase
  alias Rumbl.User

  @valid_attrs %{name: "User Name", username: "username"}

  test "converts unique_constraint on username to error" do
    username = "existing"
    insert_user(username: username)
    attrs = Map.put(@valid_attrs, :username, username)
    changeset = User.changeset(%User{}, attrs)

    assert {:error, changeset} = Repo.insert(changeset)
    assert {:username, "has already been taken"} in changeset.errors
  end
end

