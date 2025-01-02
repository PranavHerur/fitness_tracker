defmodule FitnessTracker.Activities.BikeRide do
  use Ecto.Schema
  import Ecto.Changeset


  @fields [:name, :distance, :duration, :user_uid]

  schema "bike_ride" do
    field :name, :string
    field :uid, Ecto.UUID, autogenerate: {Uniq.UUID, :uuid7, []}
    field :distance, :float
    field :duration, :float

    field :user_uid, Ecto.UUID

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(bike_ride, attrs) do
    bike_ride
    |> cast(attrs, @fields)
    |> validate_required([:name])
  end
end
