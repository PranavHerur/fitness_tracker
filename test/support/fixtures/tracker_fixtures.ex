defmodule FitnessTracker.TrackerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FitnessTracker.Tracker` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> FitnessTracker.Tracker.create_user()

    user
  end
end
