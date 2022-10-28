defmodule TrickingBattle.Battles.Vote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "votes" do
    belongs_to :battle, TrickingBattle.Battles.Battle
    belongs_to :judge, TrickingBattle.Battles.Judge
    belongs_to :tricker, TrickingBattle.Battles.Tricker

    timestamps()
  end

  @doc false
  def changeset(vote, attrs) do
    vote
    |> cast(attrs, [:battle_id, :judge_id, :tricker_id])
    |> validate_required([:battle_id, :judge_id, :tricker_id])
  end

  # TODO: Validate tricker is in battle
end
