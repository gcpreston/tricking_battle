defmodule TrickingBattle.Battles.Tricker do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trickers" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(tricker, attrs) do
    tricker
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
