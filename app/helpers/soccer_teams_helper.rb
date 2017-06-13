module SoccerTeamsHelper

  def update_vacancy_soccer_team
    if soccer_team_id
      soccer = SoccerTeam.find(self.soccer_team_id)
      # soccer.vacancy_users = 11 - soccer.users.count
      soccer.update(vacancy_users: (11 - soccer.users.count))
    end
  end
end
