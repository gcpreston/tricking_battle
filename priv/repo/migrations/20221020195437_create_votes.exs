defmodule TrickingBattle.Repo.Migrations.CreateVotes do
  use Ecto.Migration

  def change do
    create table(:votes) do
      add :battle_id, references(:battles, on_delete: :nothing), null: false
      add :judge_id, references(:judges, on_delete: :nothing), null: false
      add :tricker_id, references(:trickers, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:votes, [:battle_id])
    create index(:votes, [:judge_id])
    create index(:votes, [:tricker_id])
  end
end
