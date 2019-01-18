defmodule Appman.Repo do
  use Ecto.Repo,
    otp_app: :appman,
    adapter: Ecto.Adapters.Postgres
end
