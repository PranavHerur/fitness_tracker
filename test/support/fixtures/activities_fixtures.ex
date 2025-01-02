defmodule FitnessTracker.ActivitiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FitnessTracker.Activities` context.
  """

  @doc """
  Generate a bike_ride.
  """
  def bike_ride_fixture(attrs \\ %{}) do
    {:ok, bike_ride} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> FitnessTracker.Activities.create_bike_ride()

    bike_ride
  end
end
