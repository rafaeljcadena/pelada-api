class AddMoreFieldsToSoccerTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :soccer_teams, :goals_scored, :int, default: 0
    add_column :soccer_teams, :red_cards, :int, default: 0
    add_column :soccer_teams, :yellow_cards, :int, default: 0
  end
end
