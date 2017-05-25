class User < ApplicationRecord
  belongs_to :soccer_team
	has_one :address, dependent: :destroy
	accepts_nested_attributes_for :address
	before_save :is_active?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 
	def is_active?
		self.active = true if self.soccer_team_id
	end
end
