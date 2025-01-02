defmodule FitnessTracker.ActivitiesTest do
  use FitnessTracker.DataCase

  alias FitnessTracker.Activities

  describe "bike_ride" do
    alias FitnessTracker.Activities.BikeRide

    import FitnessTracker.ActivitiesFixtures
    import FitnessTracker.UsersFixtures

    @invalid_attrs %{name: nil, distance: nil, duration: nil, user_uid: nil}

    defp create_user_and_get_uid do
      user_fixture()
      |> Map.get(:uid)
    end

    test "list_bike_ride/0 returns all bike_ride" do
      user_uid = create_user_and_get_uid()
      bike_ride = bike_ride_fixture(%{user_uid: user_uid})
      assert Activities.list_bike_ride() == [bike_ride]
    end

    test "get_bike_ride!/1 returns the bike_ride with given id" do
      user_uid = create_user_and_get_uid()
      bike_ride = bike_ride_fixture(%{user_uid: user_uid})
      assert Activities.get_bike_ride!(bike_ride.uid) == bike_ride
    end

    test "create_bike_ride/1 with valid data creates a bike_ride" do
      user_uid = create_user_and_get_uid()
      valid_attrs = %{
        name: "some name",
        distance: 120.5,
        duration: 45.5,
        user_uid: user_uid
      }

      assert {:ok, %BikeRide{} = bike_ride} = Activities.create_bike_ride(valid_attrs)
      assert bike_ride.name == "some name"
      assert bike_ride.distance == 120.5
      assert bike_ride.duration == 45.5
      assert bike_ride.user_uid != nil
    end

    test "create_bike_ride/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Activities.create_bike_ride(@invalid_attrs)
    end

    test "update_bike_ride/2 with valid data updates the bike_ride" do
      user_uid = create_user_and_get_uid()
      bike_ride = bike_ride_fixture(%{user_uid: user_uid})
      update_attrs = %{
        name: "some updated name",
        distance: 130.5,
        duration: 50.5,
        user_uid: user_uid
      }

      assert {:ok, %BikeRide{} = bike_ride} = Activities.update_bike_ride(bike_ride, update_attrs)
      assert bike_ride.name == "some updated name"
      assert bike_ride.distance == 130.5
      assert bike_ride.duration == 50.5
      assert bike_ride.user_uid != nil
    end

    test "update_bike_ride/2 with invalid data returns error changeset" do
      bike_ride = bike_ride_fixture()
      assert {:error, %Ecto.Changeset{}} = Activities.update_bike_ride(bike_ride, @invalid_attrs)
      assert bike_ride == Activities.get_bike_ride!(bike_ride.uid)
    end

    test "delete_bike_ride/1 deletes the bike_ride" do
      user_uid = create_user_and_get_uid()
      bike_ride = bike_ride_fixture(%{user_uid: user_uid})
      assert {:ok, %BikeRide{}} = Activities.delete_bike_ride(bike_ride)
      assert nil == Activities.get_bike_ride!(bike_ride.uid)
    end

    test "change_bike_ride/1 returns a bike_ride changeset" do
      user_uid = create_user_and_get_uid()
      bike_ride = bike_ride_fixture(%{user_uid: user_uid})
      assert %Ecto.Changeset{} = Activities.change_bike_ride(bike_ride)
    end
  end
end
