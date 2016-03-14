defmodule Rumbl.VideoChannel do
  use Rumbl.Web, :channel

  def join("videos:" <> video_id, _params, socket) do
    {:ok, socket}
  end

  def handle_in("new_annotation", params, socket) do
    user = Repo.get(Rumbl.User, socket.assigns.user_id)
    broadcast! socket, "new_annotation",
      %{
        user: %{username: user.name},
        body: params["body"],
        at: params["at"]
      }
    {:reply, :ok, socket}
  end
end

