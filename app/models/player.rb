class Player < ActiveRecord::Base
	belongs_to :soccer_team
	has_one :address, dependent: :destroy
	accepts_nested_attributes_for :address
	before_save :is_active?

	validates :nome, :birthdate, :cpf, :email, :descricao, :position, :cell_phone, :home_phone, presence: true

  validates :email, email_format: { message: "E-mail inválido.", allow_blank: true }

	@@positions = ["atacante", "goleiro", "zagueiro", "lateral_esquerdo", "lateral_direito"]
	def self.positions
		@@positions
	end

	validates :position, inclusion: {in: Player.positions, allow_blank: true}

	def is_active?
		self.active = true if self.soccer_team_id
	end

end
