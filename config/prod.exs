use Mix.Config

get_env = fn key -> Map.fetch!(System.get_env(), key) end

config :appman, AppmanWeb.Endpoint,
  http: [:inet6, port: System.get_env("PORT") || 4000],
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: get_env.("SECRET_KEY_BASE")

# Do not print debug messages in production
config :logger, level: :info

config :appman, AppmanWeb.Endpoint, secret_key_base: get_env.("SECRET_KEY_BASE")

# Configure your database
config :appman, Appman.Repo,
  url: get_env.("DATABASE_URL"),
  pool_size: String.to_integer(get_env.("POOL_SIZE") || "10"),
  ssl: true
