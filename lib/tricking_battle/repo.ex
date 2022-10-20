defmodule TrickingBattle.Repo do
  use Ecto.Repo,
    otp_app: :tricking_battle,
    adapter: Ecto.Adapters.Postgres
end
