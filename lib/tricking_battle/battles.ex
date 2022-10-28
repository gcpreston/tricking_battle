defmodule TrickingBattle.Battles do
  @moduledoc """
  The Battles context.
  """

  import Ecto.Query, warn: false
  alias TrickingBattle.Repo

  alias TrickingBattle.Battles.Battle

  @topic inspect(__MODULE__)

  def subscribe do
    Phoenix.PubSub.subscribe(TrickingBattle.PubSub, @topic)
  end

  def subscribe(battle_id) do
    Phoenix.PubSub.subscribe(TrickingBattle.PubSub, @topic <> "#{battle_id}")
  end

  @doc """
  Returns the list of battles.

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
  Gets a preloaded single battle.

  Raises `Ecto.NoResultsError` if the Battle does not exist.
  """
  def get_loaded_battle!(id) do
    query =
      from battle in Battle,
        join: tricker1 in assoc(battle, :tricker1),
        join: tricker2 in assoc(battle, :tricker2),
        join: judges in assoc(battle, :judges),
        where: battle.id == ^id,
        preload: [
          tricker1: tricker1,
          tricker2: tricker2,
          judges: judges
        ]

    Repo.one!(query)
  end

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
    |> notify_subscribers([:battle, :created])
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
    |> notify_subscribers([:battle, :updated])
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
    |> notify_subscribers([:battle, :deleted])
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
    |> notify_subscribers([:judge, :assigned])
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
    |> notify_subscribers([:judge, :unassigned])
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
    |> notify_subscribers([:vote, :created])
  end

  ## Notify subscribers
  # - on battle create/update/delete, notify overall topic as well as battle topic
  # - on vote create, notify only the battle topic

  defp notify_subscribers({:ok, %Battle{} = result}, [:battle, _action] = event) do
    Phoenix.PubSub.broadcast(TrickingBattle.PubSub, @topic, {__MODULE__, event, result})

    Phoenix.PubSub.broadcast(
      TrickingBattle.PubSub,
      @topic <> "#{result.id}",
      {__MODULE__, event, result}
    )

    {:ok, result}
  end

  defp notify_subscribers({:ok, %Vote{} = result}, [:vote, _action] = event) do
    battle_id = result.battle_id

    Phoenix.PubSub.broadcast(
      TrickingBattle.PubSub,
      @topic <> "#{battle_id}",
      {__MODULE__, event, result}
    )

    {:ok, result}
  end

  defp notify_subscribers({:ok, %BattleJudge{} = result}, [:judge, _action] = event) do
    battle_id = result.battle_id

    Phoenix.PubSub.broadcast(
      TrickingBattle.PubSub,
      @topic <> "#{battle_id}",
      {__MODULE__, event, result}
    )

    {:ok, result}
  end

  defp notify_subscribers({:error, reason}, _event), do: {:error, reason}
end
