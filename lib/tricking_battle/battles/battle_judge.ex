defmodule TrickingBattle.Battles.BattleJudge do
  use Ecto.Schema
  import Ecto.Changeset

  schema "battle_judges" do
    belongs_to :battle, TrickingBattle.Battles.Battle
    belongs_to :judge, TrickingBattle.Battles.Judge

    timestamps()
  end

  @doc false
  def changeset(battle_judge, attrs) do
    battle_judge
    |> cast(attrs, [:battle_id, :judge_id])
    |> validate_required([:battle_id, :judge_id])
  end

  # TODO: Unique constraint on battle + judge
end
