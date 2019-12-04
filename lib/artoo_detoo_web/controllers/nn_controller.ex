defmodule ArtooDetooWeb.NnController do
  use ArtooDetooWeb, :controller
  alias Emlt.NN.Network

  def check(conn, params) do
    conf = Application.fetch_env!(:artoo_detoo, :nn)
    #Emlt.NN.Network.init(conf)
    matrix =
      params["data"]
        |> Enum.map(fn x -> String.to_integer(x) end)
        |> Enum.chunk_every(28)
        |> Matrex.new()
      #|> Matrex.heatmap

    Matrex.heatmap(matrix)

    res = Network.test(conf, matrix)
    render conn, "api.json", status: res
  end
end
