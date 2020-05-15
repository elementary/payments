import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :payments, Payments.Repo,
  username: "postgres",
  password: "postgres",
  database: "payments_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "postgres",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :payments, PaymentsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :stripity_stripe,
  api_key: "sk_test_JO1Q2KYQW3tCYXdhGlw9VHsG",
  public_key: "pk_test_MrafeP8AsKSMKCZFfHmp6Upc"
