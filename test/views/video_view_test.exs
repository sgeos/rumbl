defmodule Rumbl.VideoViewTest do
  use Rumbl.ConnCase, async: true
  import Phoenix.View

  test "renders index.html", %{conn: conn} do
    videos = [
      %Rumbl.Video{id: "1", title: "one"},
      %Rumbl.Video{id: "2", title: "two"}
    ]
    content = render_to_string(Rumbl.VideoView,
      "index.html", conn: conn, videos: videos)

    assert String.contains?(content, "Listing videos")
    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end

  test "renders new.html", %{conn: conn} do
    changeset = Rumbl.Video.changeset(%Rumbl.Video{})
    categories = [{"category", 123}]
    content = render_to_string(Rumbl.VideoView, "new.html",
      conn: conn, changeset: changeset, categories: categories)
    assert String.contains?(content, "New video")
  end
end

