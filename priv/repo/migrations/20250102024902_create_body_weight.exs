defmodule FitnessTracker.Repo.Migrations.CreateBodyWeight do
  use Ecto.Migration

  def up do
    create table(:body_weight) do
      add :name, :string
      add :reps, :integer
      add :user_uid, :uuid
      add :uid, :uuid

      timestamps(type: :utc_datetime)
    end
  end

  def down do
    drop table(:body_weight)
  end
end
