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

  alias TrickingBattle.Battles.Tricker

  @doc """
  Returns the list of trickers.

  ## Examples

      iex> list_trickers()
      [%Tricker{}, ...]

  """
  def list_trickers do
    Repo.all(Tricker)
  end

  @doc """
  Gets a single tricker.

  Raises `Ecto.NoResultsError` if the Tricker does not exist.

  ## Examples

      iex> get_tricker!(123)
      %Tricker{}

      iex> get_tricker!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tricker!(id), do: Repo.get!(Tricker, id)

  @doc """
  Creates a tricker.

  ## Examples

      iex> create_tricker(%{field: value})
      {:ok, %Tricker{}}

      iex> create_tricker(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tricker(attrs \\ %{}) do
    %Tricker{}
    |> Tricker.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tricker.

  ## Examples

      iex> update_tricker(tricker, %{field: new_value})
      {:ok, %Tricker{}}

      iex> update_tricker(tricker, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tricker(%Tricker{} = tricker, attrs) do
    tricker
    |> Tricker.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tricker.

  ## Examples

      iex> delete_tricker(tricker)
      {:ok, %Tricker{}}

      iex> delete_tricker(tricker)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tricker(%Tricker{} = tricker) do
    Repo.delete(tricker)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tricker changes.

  ## Examples

      iex> change_tricker(tricker)
      %Ecto.Changeset{data: %Tricker{}}

  """
  def change_tricker(%Tricker{} = tricker, attrs \\ %{}) do
    Tricker.changeset(tricker, attrs)
  end

  alias TrickingBattle.Battles.Judge

  @doc """
  Returns the list of judges.

  ## Examples

      iex> list_judges()
      [%Judge{}, ...]

  """
  def list_judges do
    Repo.all(Judge)
  end

  @doc """
  Gets a single judge.

  Raises `Ecto.NoResultsError` if the Judge does not exist.

  ## Examples

      iex> get_judge!(123)
      %Judge{}

      iex> get_judge!(456)
      ** (Ecto.NoResultsError)

  """
  def get_judge!(id), do: Repo.get!(Judge, id)

  @doc """
  Creates a judge.

  ## Examples

      iex> create_judge(%{field: value})
      {:ok, %Judge{}}

      iex> create_judge(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_judge(attrs \\ %{}) do
    %Judge{}
    |> Judge.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a judge.

  ## Examples

      iex> update_judge(judge, %{field: new_value})
      {:ok, %Judge{}}

      iex> update_judge(judge, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_judge(%Judge{} = judge, attrs) do
    judge
    |> Judge.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a judge.

  ## Examples

      iex> delete_judge(judge)
      {:ok, %Judge{}}

      iex> delete_judge(judge)
      {:error, %Ecto.Changeset{}}

  """
  def delete_judge(%Judge{} = judge) do
    Repo.delete(judge)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking judge changes.

  ## Examples

      iex> change_judge(judge)
      %Ecto.Changeset{data: %Judge{}}

  """
  def change_judge(%Judge{} = judge, attrs \\ %{}) do
    Judge.changeset(judge, attrs)
  end

  alias TrickingBattle.Battles.BattleJudge

  @doc """
  Returns the list of battle_judges.

  ## Examples

      iex> list_battle_judges()
      [%BattleJudge{}, ...]

  """
  def list_battle_judges do
    Repo.all(BattleJudge)
  end

  @doc """
  Gets a single battle_judge.

  Raises `Ecto.NoResultsError` if the Battle judge does not exist.

  ## Examples

      iex> get_battle_judge!(123)
      %BattleJudge{}

      iex> get_battle_judge!(456)
      ** (Ecto.NoResultsError)

  """
  def get_battle_judge!(id), do: Repo.get!(BattleJudge, id)

  @doc """
  Creates a battle_judge.

  ## Examples

      iex> create_battle_judge(%{field: value})
      {:ok, %BattleJudge{}}

      iex> create_battle_judge(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_battle_judge(attrs \\ %{}) do
    %BattleJudge{}
    |> BattleJudge.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a battle_judge.

  ## Examples

      iex> update_battle_judge(battle_judge, %{field: new_value})
      {:ok, %BattleJudge{}}

      iex> update_battle_judge(battle_judge, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_battle_judge(%BattleJudge{} = battle_judge, attrs) do
    battle_judge
    |> BattleJudge.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a battle_judge.

  ## Examples

      iex> delete_battle_judge(battle_judge)
      {:ok, %BattleJudge{}}

      iex> delete_battle_judge(battle_judge)
      {:error, %Ecto.Changeset{}}

  """
  def delete_battle_judge(%BattleJudge{} = battle_judge) do
    Repo.delete(battle_judge)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking battle_judge changes.

  ## Examples

      iex> change_battle_judge(battle_judge)
      %Ecto.Changeset{data: %BattleJudge{}}

  """
  def change_battle_judge(%BattleJudge{} = battle_judge, attrs \\ %{}) do
    BattleJudge.changeset(battle_judge, attrs)
  end

  alias TrickingBattle.Battles.Vote

  @doc """
  Returns the list of votes.

  ## Examples

      iex> list_votes()
      [%Vote{}, ...]

  """
  def list_votes do
    Repo.all(Vote)
  end

  @doc """
  Gets a single vote.

  Raises `Ecto.NoResultsError` if the Vote does not exist.

  ## Examples

      iex> get_vote!(123)
      %Vote{}

      iex> get_vote!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vote!(id), do: Repo.get!(Vote, id)

  @doc """
  Creates a vote.

  ## Examples

      iex> create_vote(%{field: value})
      {:ok, %Vote{}}

      iex> create_vote(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vote(attrs \\ %{}) do
    %Vote{}
    |> Vote.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vote.

  ## Examples

      iex> update_vote(vote, %{field: new_value})
      {:ok, %Vote{}}

      iex> update_vote(vote, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vote(%Vote{} = vote, attrs) do
    vote
    |> Vote.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a vote.

  ## Examples

      iex> delete_vote(vote)
      {:ok, %Vote{}}

      iex> delete_vote(vote)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vote(%Vote{} = vote) do
    Repo.delete(vote)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vote changes.

  ## Examples

      iex> change_vote(vote)
      %Ecto.Changeset{data: %Vote{}}

  """
  def change_vote(%Vote{} = vote, attrs \\ %{}) do
    Vote.changeset(vote, attrs)
  end
end
