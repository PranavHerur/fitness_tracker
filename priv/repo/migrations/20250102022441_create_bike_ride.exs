defmodule FitnessTracker.Repo.Migrations.CreateBikeRide do
  use Ecto.Migration

  def up do
    create table(:bike_ride) do
      add :name, :string
      add :uid, :uuid
      add :distance, :float
      add :duration, :float
      add :user_uid, references(:user, column: :uid, type: :uuid)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:bike_ride, [:uid])
  end

  def down do
    drop unique_index(:bike_ride, [:uid])
    drop table(:bike_ride)
  end
end
