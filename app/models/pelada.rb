class Pelada < ApplicationRecord
	has_one :address, dependent: :destroy
	has_many :soccer_teams
	# accepts_nested_attributes_for :soccer_teams
	
	belongs_to :host, class_name: "SoccerTeam", foreign_key: "host_id"
	belongs_to :guest, class_name: "SoccerTeam", foreign_key: "guest_id"

  def as_json(options=nil)
    {
    	title: title,
    	begin: self.begin,
  		host_id: host_id,
  		guest_id: guest_id,
  		lat: lat,
  		lng: lng,
  		created_at: created_at
    }
  end

end