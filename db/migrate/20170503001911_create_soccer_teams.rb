class CreateSoccerTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :soccer_teams do |t|

      t.timestamps
    end
  end
end
