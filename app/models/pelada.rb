class Pelada < ApplicationRecord
	has_one :address, dependent: :destroy
	has_many :soccer_teams
	# accepts_nested_attributes_for :soccer_teams
	
	belongs_to :host, class_name: "SoccerTeam", foreign_key: "host_id"
	belongs_to :guest, class_name: "SoccerTeam", foreign_key: "guest_id"
end