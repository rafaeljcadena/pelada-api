class ChangeNameColumnVacancyPlayersToSoccerTeam < ActiveRecord::Migration[5.0]
  def change
  	rename_column :soccer_teams, :vacancy_players, :vacancy_users
  end
end
