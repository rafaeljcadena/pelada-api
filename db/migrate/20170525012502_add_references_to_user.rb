class AddReferencesToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :soccer_team, foreign_key: true
  end
end
