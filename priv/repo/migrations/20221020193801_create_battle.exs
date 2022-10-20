defmodule TrickingBattle.Repo.Migrations.CreateBattle do
  use Ecto.Migration

  def change do
    create table(:battle) do
      add :tricker1, :string
      add :tricker2, :string

      timestamps()
    end
  end
end
