defmodule TrickingBattle.Battles do
  @moduledoc """
  The Battles context.
  """

  import Ecto.Query, warn: false
  alias TrickingBattle.Repo

  alias TrickingBattle.Battles.Battle

  @doc """
  Returns the list of battle.

  ## Examples

      iex> list_battle()
      [%Battle{}, ...]

  """
  def list_battle do
    Repo.all(Battle)
  end

  @doc """
  Gets a single battle.

  Raises `Ecto.NoResultsError` if the Battle does not exist.

  ## Examples

      iex> get_battle!(123)
      %Battle{}

      iex> get_battle!(456)
      ** (Ecto.NoResultsError)

  """
  def get_battle!(id), do: Repo.get!(Battle, id)

  @doc """
  Creates a battle.

  ## Examples

      iex> create_battle(%{field: value})
      {:ok, %Battle{}}

      iex> create_battle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_battle(attrs \\ %{}) do
    %Battle{}
    |> Battle.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a battle.

  ## Examples

      iex> update_battle(battle, %{field: new_value})
      {:ok, %Battle{}}

      iex> update_battle(battle, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_battle(%Battle{} = battle, attrs) do
    battle
    |> Battle.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a battle.

  ## Examples

      iex> delete_battle(battle)
      {:ok, %Battle{}}

      iex> delete_battle(battle)
      {:error, %Ecto.Changeset{}}

  """
  def delete_battle(%Battle{} = battle) do
    Repo.delete(battle)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking battle changes.

  ## Examples

      iex> change_battle(battle)
      %Ecto.Changeset{data: %Battle{}}

  """
  def change_battle(%Battle{} = battle, attrs \\ %{}) do
    Battle.changeset(battle, attrs)
  end
end
