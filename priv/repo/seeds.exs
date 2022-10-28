# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TrickingBattle.Repo.insert!(%TrickingBattle.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TrickingBattle.Repo
alias TrickingBattle.Battles.{Battle, Tricker, BattleJudge, Judge}

ethan = Repo.insert!(%Tricker{name: "Ethan Turner"})
tiki = Repo.insert!(%Tricker{name: "Tiki Wu"})

battle = Repo.insert!(%Battle{tricker1_id: ethan.id, tricker2_id: tiki.id})

kerwood = Repo.insert!(%Judge{name: "Alex Kerwood"})
mark = Repo.insert!(%Judge{name: "Mark Rusmantijo"})

Repo.insert!(%BattleJudge{battle_id: battle.id, judge_id: kerwood.id})
Repo.insert!(%BattleJudge{battle_id: battle.id, judge_id: mark.id})
