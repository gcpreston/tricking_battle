defmodule TrickingBattle.Battles.Judge do
  use Ecto.Schema
  import Ecto.Changeset

  schema "judges" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(judge, attrs) do
    judge
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
