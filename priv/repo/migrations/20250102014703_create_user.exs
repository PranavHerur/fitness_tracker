defmodule FitnessTracker.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def up do
    create table(:user) do
      add :name, :string
      add :uid, :uuid

      timestamps(type: :utc_datetime)
    end

    create unique_index(:user, [:uid])
  end

  def down do
    drop unique_index(:user, [:uid])
    drop table(:user)
  end
end
