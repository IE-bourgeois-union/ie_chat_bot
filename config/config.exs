# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ie_chat_bot,
  ecto_repos: [IeChatBot.Repo]

# Configures the endpoint
config :ie_chat_bot, IeChatBotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HzkBfLdKvAcZ36yhASe2rgeO6J0Hk/rxxrqnQJ/xGHlbdXSuyfK0rnZMQnyqQJg8",
  render_errors: [view: IeChatBotWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: IeChatBot.PubSub,
  live_view: [signing_salt: "amzQolru"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
