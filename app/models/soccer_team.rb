class SoccerTeam < ApplicationRecord
	has_many :players, dependent: :destroy
	has_many :users, dependent: :destroy
	has_many :peladas_host, class_name: "Pelada", foreign_key: "host_id"
	has_many :peladas_guest, class_name: "Pelada", foreign_key: "guest_id"
end
