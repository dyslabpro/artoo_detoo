defmodule ArtooDetooWeb.NnView do
  use ArtooDetooWeb, :view

  def render("api.json", %{status: status}) do
    %{status: status}
  end
end
