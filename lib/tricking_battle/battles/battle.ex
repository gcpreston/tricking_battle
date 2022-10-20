defmodule TrickingBattle.Battles.Battle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "battle" do
    field :tricker1, :string
    field :tricker2, :string

    timestamps()
  end

  @doc false
  def changeset(battle, attrs) do
    battle
    |> cast(attrs, [:tricker1, :tricker2])
    |> validate_required([:tricker1, :tricker2])
  end
end
