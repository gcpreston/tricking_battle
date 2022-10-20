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
end
