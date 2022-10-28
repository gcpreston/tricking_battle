defmodule TrickingBattleWeb.BattleLive do
  use TrickingBattleWeb, :live_view

  alias TrickingBattle.Battles

  @impl true
  def mount(%{"id" => battle_id}, _params, socket) do
    battle = Battles.get_loaded_battle!(battle_id)
    judge = Battles.get_judge!(1)

    if connected?(socket) do
      Battles.subscribe(battle_id)
    end

    {:ok, socket |> assign(battle: battle, judge: judge), temporary_assigns: [votes: []]}
  end

  @impl true
  def render(assigns) do
    ~H"""
      <div id="battle-live">
        Battle info
        <ul>
          <li>Tricker 1: <%= @battle.tricker1.name %></li>
          <li>Tricker 2: <%= @battle.tricker2.name %></li>
        </ul>

        Judges:
        <ul>
          <%= for judge <- @battle.judges do %>
            <li><%= judge.name %></li>
          <% end %>
        </ul>

        <div>
          <button phx-click="vote-tricker1">Vote tricker 1</button>
          <button phx-click="vote-tricker2">Vote tricker 2</button>
        </div>

        Votes:
        <ul id="votes" phx-update="append">
          <%= for vote <- @votes do %>
            <li id={"vote#{vote.id}"}>Judge <%= vote.judge_id %> voted for tricker <%= vote.tricker_id %></li>
          <% end %>
        </ul>
      </div>
    """
  end

  @impl true
  def handle_event("vote-tricker1", _value, socket) do
    {:ok, _vote} = Battles.create_vote(%{
      battle_id: socket.assigns.battle.id,
      judge_id: socket.assigns.judge.id,
      tricker_id: socket.assigns.battle.tricker1_id
    })

    {:noreply, socket}
  end

  # TODO: Consolidate
  def handle_event("vote-tricker2", _value, socket) do
    {:ok, _vote} = Battles.create_vote(%{
      battle_id: socket.assigns.battle.id,
      judge_id: socket.assigns.judge.id,
      tricker_id: socket.assigns.battle.tricker2_id
    })

    {:noreply, socket}
  end

  @impl true
  def handle_info({Battles, [:vote, :created], result}, socket) do
    {:noreply, socket |> update(:votes, fn votes -> [result | votes] end)}
  end
end
