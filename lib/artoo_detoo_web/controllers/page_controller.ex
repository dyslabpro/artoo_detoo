defmodule ArtooDetooWeb.PageController do
  use ArtooDetooWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
