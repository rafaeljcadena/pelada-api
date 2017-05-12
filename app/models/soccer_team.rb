class SoccerTeam < ApplicationRecord
	has_many :players, dependent: :destroy
	has_many :peladas
	
end
