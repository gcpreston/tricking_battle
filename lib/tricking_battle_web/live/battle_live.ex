defmodule TrickingBattleWeb.BattleLive do
  use TrickingBattleWeb, :live_view

  alias TrickingBattle.Battles

  @impl true
  def mount(%{"id" => battle_id}, _params, socket) do
    battle = Battles.get_loaded_battle!(battle_id)

    {:ok, socket |> assign(:battle, battle)}
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

        <button phx-click="vote-tricker1">Vote tricker 1</button>
        <button phx-click="vote-tricker2">Vote tricker 2</button>
      </div>
    """
  end
end
