# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :artoo_detoo, ArtooDetooWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Bi/ZXzYaecGPNHr0OOhnAHW5kmc56XYrZUU2dvsczt3Pqe1RP90sLqrdnPEaqgMu",
  render_errors: [view: ArtooDetooWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ArtooDetoo.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :artoo_detoo,
  nn: %{
    table: :digit_recognizer_neurons,
    mode: :test,
    backup: 'neurons-041219.dets',
    layers: [
      %{
        size: {17, 17},
        size_nc: 28,
        nc_weights: -5..5,
        z_index: 2,
        targets: nil,
        role: "hidden",
        rate: 0.1
      },
      %{
        size: {1, 10},
        size_nc: 17,
        nc_weights: -5..5,
        z_index: 3,
        targets: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
        role: "out",
        rate: 0.1
      }
    ]
  }
