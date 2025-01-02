defmodule FitnessTracker.Repo do
  use Ecto.Repo,
    otp_app: :fitness_tracker,
    adapter: Ecto.Adapters.Postgres
end
