defmodule Rumbl.Channels.UserSocketTest do
  use Rumbl.ChannelCase, async: true
  alias Rumbl.UserSocket

  test "socket authentication with valid token" do
    user_id = "user_id"
    token = Phoenix.Token.sign(@endpoint, "user socket", user_id)

    assert {:ok, socket} = connect(UserSocket, %{"token" => token})
    assert socket.assigns.user_id == user_id
  end

  test "socket authentication invalid token" do
    assert :error = connect(UserSocket, %{"token" => "bad token"})
    assert :error = connect(UserSocket, %{})
  end
end

