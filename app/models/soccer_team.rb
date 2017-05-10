class SoccerTeam < ApplicationRecord
	has_many :players, dependent: :destroy
end
