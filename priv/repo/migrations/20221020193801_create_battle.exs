defmodule TrickingBattle.Repo.Migrations.CreateBattle do
  use Ecto.Migration

  def change do
    create table(:trickers) do
      add :name, :string, null: false

      timestamps()
    end

    create table(:judges) do
      add :name, :string, null: false

      timestamps()
    end

    create table(:battles) do
      add :tricker1_id, references(:trickers), null: false
      add :tricker2_id, references(:trickers), null: false

      timestamps()
    end

    create table(:battle_judges) do
      add :battle_id, references(:battles, on_delete: :nothing), null: false
      add :judge_id, references(:judges, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:battle_judges, [:battle_id])
    create index(:battle_judges, [:judge_id])
  end
end
