defmodule TrickingBattle.BattlesTest do
  use TrickingBattle.DataCase

  alias TrickingBattle.Battles

  describe "battle" do
    alias TrickingBattle.Battles.Battle

    import TrickingBattle.BattlesFixtures

    @invalid_attrs %{tricker1: nil, tricker2: nil}

    test "list_battle/0 returns all battle" do
      battle = battle_fixture()
      assert Battles.list_battle() == [battle]
    end

    test "get_battle!/1 returns the battle with given id" do
      battle = battle_fixture()
      assert Battles.get_battle!(battle.id) == battle
    end

    test "create_battle/1 with valid data creates a battle" do
      valid_attrs = %{tricker1: "some tricker1", tricker2: "some tricker2"}

      assert {:ok, %Battle{} = battle} = Battles.create_battle(valid_attrs)
      assert battle.tricker1 == "some tricker1"
      assert battle.tricker2 == "some tricker2"
    end

    test "create_battle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Battles.create_battle(@invalid_attrs)
    end

    test "update_battle/2 with valid data updates the battle" do
      battle = battle_fixture()
      update_attrs = %{tricker1: "some updated tricker1", tricker2: "some updated tricker2"}

      assert {:ok, %Battle{} = battle} = Battles.update_battle(battle, update_attrs)
      assert battle.tricker1 == "some updated tricker1"
      assert battle.tricker2 == "some updated tricker2"
    end

    test "update_battle/2 with invalid data returns error changeset" do
      battle = battle_fixture()
      assert {:error, %Ecto.Changeset{}} = Battles.update_battle(battle, @invalid_attrs)
      assert battle == Battles.get_battle!(battle.id)
    end

    test "delete_battle/1 deletes the battle" do
      battle = battle_fixture()
      assert {:ok, %Battle{}} = Battles.delete_battle(battle)
      assert_raise Ecto.NoResultsError, fn -> Battles.get_battle!(battle.id) end
    end

    test "change_battle/1 returns a battle changeset" do
      battle = battle_fixture()
      assert %Ecto.Changeset{} = Battles.change_battle(battle)
    end
  end
end
