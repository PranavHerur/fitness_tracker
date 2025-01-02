defmodule FitnessTracker.Tracker.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :name, :string
    field :uid, Ecto.UUID, autogenerate: {Uniq.UUID, :uuid7, []}

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
