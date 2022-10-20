defmodule TrickingBattle.Battles.Battle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "battle" do
    belongs_to :tricker1, TrickingBattle.Battles.Tricker
    belongs_to :tricker2, TrickingBattle.Battles.Tricker

    timestamps()
  end

  @doc false
  def changeset(battle, attrs) do
    battle
    |> cast(attrs, [:tricker1_id, :tricker2_id])
    |> validate_required([:tricker1_id, :tricker2_id])
  end
end
