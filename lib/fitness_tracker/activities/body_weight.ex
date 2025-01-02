defmodule FitnessTracker.Activities.BodyWeight do
  use Ecto.Schema
  import Ecto.Changeset

  schema "body_weight" do
    field :name, :string
    field :reps, :integer
    field :uid, Ecto.UUID, autogenerate: {Uniq.UUID, :uuid7, []}
    field :user_uid, Ecto.UUID

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(body_weight, attrs) do
    body_weight
    |> cast(attrs, [:name, :reps, :user_uid])
    |> validate_required([:name])
  end
end
