defmodule FitnessTracker.Activities do
  @moduledoc """
  The Activities context.
  """

  import Ecto.Query, warn: false
  alias FitnessTracker.Repo

  alias FitnessTracker.Activities.BikeRide

  @doc """
  Returns the list of bike_ride.

  ## Examples

      iex> list_bike_ride()
      [%BikeRide{}, ...]

  """
  def list_bike_ride do
    BikeRide
    |> Repo.all()
  end

  @doc """
  Gets a single bike_ride.

  Raises `Ecto.NoResultsError` if the Bike ride does not exist.

  ## Examples

      iex> get_bike_ride!(123)
      %BikeRide{}

      iex> get_bike_ride!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bike_ride!(uid), do: BikeRide |> Repo.get_by(uid: uid)

  @doc """
  Creates a bike_ride.

  ## Examples

      iex> create_bike_ride(%{field: value})
      {:ok, %BikeRide{}}

      iex> create_bike_ride(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bike_ride(attrs \\ %{}) do
    %BikeRide{}
    |> BikeRide.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bike_ride.

  ## Examples

      iex> update_bike_ride(bike_ride, %{field: new_value})
      {:ok, %BikeRide{}}

      iex> update_bike_ride(bike_ride, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bike_ride(%BikeRide{} = bike_ride, attrs) do
    bike_ride
    |> BikeRide.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bike_ride.

  ## Examples

      iex> delete_bike_ride(bike_ride)
      {:ok, %BikeRide{}}

      iex> delete_bike_ride(bike_ride)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bike_ride(%BikeRide{} = bike_ride) do
    Repo.delete(bike_ride)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bike_ride changes.

  ## Examples

      iex> change_bike_ride(bike_ride)
      %Ecto.Changeset{data: %BikeRide{}}

  """
  def change_bike_ride(%BikeRide{} = bike_ride, attrs \\ %{}) do
    BikeRide.changeset(bike_ride, attrs)
  end
end
