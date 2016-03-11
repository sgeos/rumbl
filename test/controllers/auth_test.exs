defmodule Rumbl.AuthTest do
  use Rumbl.ConnCase
  alias Rumbl.Auth

  setup %{conn: conn} do
    conn =
      conn
      |> bypass_through(Rumbl.Router, :browser)
      |> get("/")
    {:ok, %{conn: conn}}
  end

  test "authenticate_user halts when no current_user exists", %{conn: conn} do
    conn = Auth.authenticate_user(conn, [])
    assert conn.halted
  end

  test "authenticate_user continues when the current_user exists", %{conn: conn} do
    conn =
      conn
      |> assign(:current_user, %Rumbl.User{})
      |> Auth.authenticate_user([])

    refute conn.halted
  end

  test "login puts the user in the session", %{conn: conn} do
    conn =
      conn
      |> Auth.login(%Rumbl.User{id: 123})
      |> send_resp(:ok, "")
      |> get("/")
    assert get_session(conn, :user_id) == 123
  end

  test "logout drops the session", %{conn: conn} do
    conn =
      conn
      |> put_session(:user_id, 123)
      |> Auth.logout()
      |> send_resp(:ok, "")
      |> get("/")
    refute get_session(conn, :user_id)
  end

  test "call places user from session into assigns", %{conn: conn} do
    user = insert_user()
    conn =
      conn
      |> put_session(:user_id, user.id)
      |> Auth.call(Repo)

    assert conn.assigns.current_user.id == user.id
  end

  test "call with no session sets current_user assign to nil", %{conn: conn} do
    conn = Auth.call(conn, Repo)
    assert conn.assigns.current_user == nil
  end

  test "login with a valid email and password", %{conn: conn} do
    username = "username"
    password = "password"
    user = insert_user(username: username, password: password)
    {:ok, conn} =
      Auth.login_by_username_and_pass(conn, username, password, repo: Repo)
    assert conn.assigns.current_user.id == user.id
  end

  test "login with a not found user", %{conn: conn} do
    username = "username"
    password = "password"
    assert {:error, :not_found, _conn} =
      Auth.login_by_username_and_pass(conn, username, password, repo: Repo)
  end

  test "login with password mismatch", %{conn: conn} do
    username = "username"
    password = "password"
    badpassword = "badpassword"
    _user = insert_user(username: username, password: password)
    assert {:error, :unauthorized, _conn} =
      Auth.login_by_username_and_pass(conn, username, badpassword, repo: Repo)
  end
end

