class Player < ActiveRecord::Base
	belongs_to :soccer_team
	has_one :address, dependent: :destroy
	has_many :peladas
	accepts_nested_attributes_for :address

	validates :nome, :birthdate, :cpf, :descricao, :position, :cell_phone, :home_phone, presence: true

  validates :email, email_format: { message: "E-mail inválido.", allow_blank: true }

	

	@@positions = ["atacante", "goleiro", "zagueiro", "lateral_esquerdo", "lateral_direito"]
	def self.positions
		@@positions
	end
end
