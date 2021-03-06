class SoccerTeam < ApplicationRecord
	# has_many :players, dependent: :destroy
	has_many :users, dependent: :destroy
	has_many :peladas_host, class_name: "Pelada", foreign_key: "host_id", dependent: :destroy
	has_many :peladas_guest, class_name: "Pelada", foreign_key: "guest_id", dependent: :destroy
  before_create :set_vacancy_users
  # after_save :update_vacancy_soccer_team

  def update_vacancy_soccer_team
      self.update(vacancy_users: (11 - self.users.count))
  end

  def set_vacancy_users
    self.vacancy_users = 11
  end

  def as_json(options=nil)
    {
      id: id,
    	team_name: team_name,
    	vacancy_users: vacancy_users,
    	goals_scored: goals_scored,
    	open_for_subscriptions: open_for_subscriptions,
    	users: users.as_json, 
  		created_at: created_at
    }
  end
end
