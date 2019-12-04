defmodule ArtooDetoo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do

    config = Application.fetch_env!(:artoo_detoo, :nn)
    :ets.new(config.table, [
      :set,
      :public,
      :named_table,
      read_concurrency: true,
      write_concurrency: true
    ])
    #Emlt.NN.Network.init(config)
    :dets.open_file(config.backup, type: :set, ram_file: true)
    :dets.to_ets(config.backup, config.table)
    #:ets.from_dets(config.table, dets_tab)
    :observer.start
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      ArtooDetooWeb.Endpoint
      # Starts a worker by calling: ArtooDetoo.Worker.start_link(arg)
      # {ArtooDetoo.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ArtooDetoo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ArtooDetooWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
