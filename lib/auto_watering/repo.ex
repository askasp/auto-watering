defmodule AutoWatering.Repo do
  use Ecto.Repo,
    otp_app: :auto_watering,
    adapter: Ecto.Adapters.Postgres
end
