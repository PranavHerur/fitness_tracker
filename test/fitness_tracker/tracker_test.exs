defmodule FitnessTracker.TrackerTest do
  use FitnessTracker.DataCase

  alias FitnessTracker.Tracker

  describe "user" do
    alias FitnessTracker.Tracker.User

    import FitnessTracker.TrackerFixtures

    @invalid_attrs %{name: nil}

    test "list_user/0 returns all user" do
      user = user_fixture()
      assert Tracker.list_user() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Tracker.get_user!(user.uid) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %User{} = user} = Tracker.create_user(valid_attrs)
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tracker.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %User{} = user} = Tracker.update_user(user, update_attrs)
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Tracker.update_user(user, @invalid_attrs)
      assert user == Tracker.get_user!(user.uid)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Tracker.delete_user(user)
      assert nil == Tracker.get_user!(user.uid)
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Tracker.change_user(user)
    end
  end
end
