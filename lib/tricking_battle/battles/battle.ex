defmodule TrickingBattle.Battles.Battle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "battles" do
    belongs_to :tricker1, TrickingBattle.Battles.Tricker
    belongs_to :tricker2, TrickingBattle.Battles.Tricker

    many_to_many :judges, TrickingBattle.Battles.Judge, join_through: "battle_judges"

    timestamps()
  end

  @doc false
  def changeset(battle, attrs) do
    battle
    |> cast(attrs, [:tricker1_id, :tricker2_id])
    |> validate_required([:tricker1_id, :tricker2_id])
  end

  # TODO: Validate tricker1 and tricker2 are not the same
end
