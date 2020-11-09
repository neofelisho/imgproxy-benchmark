# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :imgproxy_benchmark, ImgproxyBenchmarkWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZvO5FbhwtyX55WnW/39QT/lmgnf3mmXFr6H3JZ9VSc4CgpEjFaY9+4IinI1nYZM5",
  render_errors: [view: ImgproxyBenchmarkWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ImgproxyBenchmark.PubSub,
  live_view: [signing_salt: "Qxni5OhP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :imgproxy,
  prefix: "http://localhost:8080",
  key:
    "ad29ef9ada47e86b6d92a5680324a17f008cb362e241bedb6e0f2e1321144554a38a3aaed8f3ee3222bd80e49ff763414bdcfa01483e878259eb28b8562326f2",
  salt:
    "ad29ef9ada47e86b6d92a5680324a17f008cb362e241bedb6e0f2e1321144554a38a3aaed8f3ee3222bd80e49ff763414bdcfa01483e878259eb28b8562326f2"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
