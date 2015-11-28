# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :todo_app, TodoApp.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "+KtCV73VRU059bNngsmms96qLi3/8cLTLzqDQbWli6J9hnEicIOxCs1nfcrfx9oe",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: TodoApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# config/config.exs
config :phoenix_token_auth,
  user_model: TodoApp.User,                             # ecto model used for authentication
  repo: TodoApp.Repo,                                   # ecto repo
  crypto_provider: Comeonin.Bcrypt,                     # crypto provider for hashing passwords/tokens. see http://hexdocs.pm/comeonin/
  token_validity_in_minutes: 7 * 24 * 60,               # minutes from login until a token expires
  email_sender: "myapp@example.com",                    # sender address of emails sent by the app
  emailing_module: TodoApp.EmailConstructor,              # module implementing the `PhoenixTokenAuth.MailingBehaviour` for generating emails
  mailgun_domain: "example.com",                        # domain of your mailgun account
  mailgun_key: "secret"                                 # secret key of your mailgun account
  # user_model_validator: {MyApp.Model, :user_validator}  # function receiving and returning the changeset for a user on registration and when updating the account. This is the place to run custom validations.

config :joken,
  json_module: PhoenixTokenAuth.PoisonHelper,
  algorithm: :HS256

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
