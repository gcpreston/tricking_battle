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

  describe "trickers" do
    alias TrickingBattle.Battles.Tricker

    import TrickingBattle.BattlesFixtures

    @invalid_attrs %{name: nil}

    test "list_trickers/0 returns all trickers" do
      tricker = tricker_fixture()
      assert Battles.list_trickers() == [tricker]
    end

    test "get_tricker!/1 returns the tricker with given id" do
      tricker = tricker_fixture()
      assert Battles.get_tricker!(tricker.id) == tricker
    end

    test "create_tricker/1 with valid data creates a tricker" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Tricker{} = tricker} = Battles.create_tricker(valid_attrs)
      assert tricker.name == "some name"
    end

    test "create_tricker/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Battles.create_tricker(@invalid_attrs)
    end

    test "update_tricker/2 with valid data updates the tricker" do
      tricker = tricker_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Tricker{} = tricker} = Battles.update_tricker(tricker, update_attrs)
      assert tricker.name == "some updated name"
    end

    test "update_tricker/2 with invalid data returns error changeset" do
      tricker = tricker_fixture()
      assert {:error, %Ecto.Changeset{}} = Battles.update_tricker(tricker, @invalid_attrs)
      assert tricker == Battles.get_tricker!(tricker.id)
    end

    test "delete_tricker/1 deletes the tricker" do
      tricker = tricker_fixture()
      assert {:ok, %Tricker{}} = Battles.delete_tricker(tricker)
      assert_raise Ecto.NoResultsError, fn -> Battles.get_tricker!(tricker.id) end
    end

    test "change_tricker/1 returns a tricker changeset" do
      tricker = tricker_fixture()
      assert %Ecto.Changeset{} = Battles.change_tricker(tricker)
    end
  end

  describe "judges" do
    alias TrickingBattle.Battles.Judge

    import TrickingBattle.BattlesFixtures

    @invalid_attrs %{name: nil}

    test "list_judges/0 returns all judges" do
      judge = judge_fixture()
      assert Battles.list_judges() == [judge]
    end

    test "get_judge!/1 returns the judge with given id" do
      judge = judge_fixture()
      assert Battles.get_judge!(judge.id) == judge
    end

    test "create_judge/1 with valid data creates a judge" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Judge{} = judge} = Battles.create_judge(valid_attrs)
      assert judge.name == "some name"
    end

    test "create_judge/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Battles.create_judge(@invalid_attrs)
    end

    test "update_judge/2 with valid data updates the judge" do
      judge = judge_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Judge{} = judge} = Battles.update_judge(judge, update_attrs)
      assert judge.name == "some updated name"
    end

    test "update_judge/2 with invalid data returns error changeset" do
      judge = judge_fixture()
      assert {:error, %Ecto.Changeset{}} = Battles.update_judge(judge, @invalid_attrs)
      assert judge == Battles.get_judge!(judge.id)
    end

    test "delete_judge/1 deletes the judge" do
      judge = judge_fixture()
      assert {:ok, %Judge{}} = Battles.delete_judge(judge)
      assert_raise Ecto.NoResultsError, fn -> Battles.get_judge!(judge.id) end
    end

    test "change_judge/1 returns a judge changeset" do
      judge = judge_fixture()
      assert %Ecto.Changeset{} = Battles.change_judge(judge)
    end
  end

  describe "battle_judges" do
    alias TrickingBattle.Battles.BattleJudge

    import TrickingBattle.BattlesFixtures

    @invalid_attrs %{}

    test "list_battle_judges/0 returns all battle_judges" do
      battle_judge = battle_judge_fixture()
      assert Battles.list_battle_judges() == [battle_judge]
    end

    test "get_battle_judge!/1 returns the battle_judge with given id" do
      battle_judge = battle_judge_fixture()
      assert Battles.get_battle_judge!(battle_judge.id) == battle_judge
    end

    test "create_battle_judge/1 with valid data creates a battle_judge" do
      valid_attrs = %{}

      assert {:ok, %BattleJudge{} = battle_judge} = Battles.create_battle_judge(valid_attrs)
    end

    test "create_battle_judge/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Battles.create_battle_judge(@invalid_attrs)
    end

    test "update_battle_judge/2 with valid data updates the battle_judge" do
      battle_judge = battle_judge_fixture()
      update_attrs = %{}

      assert {:ok, %BattleJudge{} = battle_judge} = Battles.update_battle_judge(battle_judge, update_attrs)
    end

    test "update_battle_judge/2 with invalid data returns error changeset" do
      battle_judge = battle_judge_fixture()
      assert {:error, %Ecto.Changeset{}} = Battles.update_battle_judge(battle_judge, @invalid_attrs)
      assert battle_judge == Battles.get_battle_judge!(battle_judge.id)
    end

    test "delete_battle_judge/1 deletes the battle_judge" do
      battle_judge = battle_judge_fixture()
      assert {:ok, %BattleJudge{}} = Battles.delete_battle_judge(battle_judge)
      assert_raise Ecto.NoResultsError, fn -> Battles.get_battle_judge!(battle_judge.id) end
    end

    test "change_battle_judge/1 returns a battle_judge changeset" do
      battle_judge = battle_judge_fixture()
      assert %Ecto.Changeset{} = Battles.change_battle_judge(battle_judge)
    end
  end

  describe "votes" do
    alias TrickingBattle.Battles.Vote

    import TrickingBattle.BattlesFixtures

    @invalid_attrs %{}

    test "list_votes/0 returns all votes" do
      vote = vote_fixture()
      assert Battles.list_votes() == [vote]
    end

    test "get_vote!/1 returns the vote with given id" do
      vote = vote_fixture()
      assert Battles.get_vote!(vote.id) == vote
    end

    test "create_vote/1 with valid data creates a vote" do
      valid_attrs = %{}

      assert {:ok, %Vote{} = vote} = Battles.create_vote(valid_attrs)
    end

    test "create_vote/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Battles.create_vote(@invalid_attrs)
    end

    test "update_vote/2 with valid data updates the vote" do
      vote = vote_fixture()
      update_attrs = %{}

      assert {:ok, %Vote{} = vote} = Battles.update_vote(vote, update_attrs)
    end

    test "update_vote/2 with invalid data returns error changeset" do
      vote = vote_fixture()
      assert {:error, %Ecto.Changeset{}} = Battles.update_vote(vote, @invalid_attrs)
      assert vote == Battles.get_vote!(vote.id)
    end

    test "delete_vote/1 deletes the vote" do
      vote = vote_fixture()
      assert {:ok, %Vote{}} = Battles.delete_vote(vote)
      assert_raise Ecto.NoResultsError, fn -> Battles.get_vote!(vote.id) end
    end

    test "change_vote/1 returns a vote changeset" do
      vote = vote_fixture()
      assert %Ecto.Changeset{} = Battles.change_vote(vote)
    end
  end
end
