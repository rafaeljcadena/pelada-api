class AddSoccerTeamToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_reference :players, :soccer_team, foreign_key: true
  end
end
