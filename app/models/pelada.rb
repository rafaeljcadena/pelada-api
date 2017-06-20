class Pelada < ApplicationRecord
	has_many :soccer_teams
	# accepts_nested_attributes_for :soccer_teams
	
	belongs_to :host, class_name: "SoccerTeam", foreign_key: "host_id"
	belongs_to :guest, class_name: "SoccerTeam", foreign_key: "guest_id"

  def as_json(options=nil)
    {
      id: id,
    	title: title,
    	begin: self.begin.strftime("%d/%m/%Y" || default),
      # host_id: host_id,
  		# host_team_name: host.team_name,
      host: host.as_json(),
      # guest_id: guest_id,
      guest: guest.as_json(),
  		# guest_team_name: guest.team_name,
      address_full: address_full,
  		lat: lat.round(6),
  		lng: lng.round(6),
  		created_at: created_at.strftime("%d/%m/%Y %H:%M" || default)
    }
  end

end