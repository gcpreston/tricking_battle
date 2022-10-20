defmodule TrickingBattle.BattlesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TrickingBattle.Battles` context.
  """

  @doc """
  Generate a battle.
  """
  def battle_fixture(attrs \\ %{}) do
    {:ok, battle} =
      attrs
      |> Enum.into(%{
        tricker1: "some tricker1",
        tricker2: "some tricker2"
      })
      |> TrickingBattle.Battles.create_battle()

    battle
  end

  @doc """
  Generate a tricker.
  """
  def tricker_fixture(attrs \\ %{}) do
    {:ok, tricker} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> TrickingBattle.Battles.create_tricker()

    tricker
  end

  @doc """
  Generate a judge.
  """
  def judge_fixture(attrs \\ %{}) do
    {:ok, judge} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> TrickingBattle.Battles.create_judge()

    judge
  end

  @doc """
  Generate a battle_judge.
  """
  def battle_judge_fixture(attrs \\ %{}) do
    {:ok, battle_judge} =
      attrs
      |> Enum.into(%{

      })
      |> TrickingBattle.Battles.create_battle_judge()

    battle_judge
  end
end
