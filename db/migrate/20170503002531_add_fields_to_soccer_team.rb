class AddFieldsToSoccerTeam < ActiveRecord::Migration[5.0]
  def change
    add_column :soccer_teams, :team_name, :string
    add_column :soccer_teams, :fouls_commited, :int, default: 0
    add_column :soccer_teams, :vacancy_players, :int
    add_column :soccer_teams, :open_for_subscriptions, :boolean, default: false
  end
end
