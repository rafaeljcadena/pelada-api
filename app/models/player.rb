class Player < ActiveRecord::Base

	validates :nome, :email, :birthdate, :cpf, :descricao, :active, :position, :cell_phone, :home_phone, presence: true
  validates :email, email_format: { message: "E-mail inválido.", allow_blank: true }


	@@positions = ["atacante", "goleiro", "zagueiro", "lateral_esquerdo", "lateral_direito"]
	def self.positions
		@@positions
	end
end
