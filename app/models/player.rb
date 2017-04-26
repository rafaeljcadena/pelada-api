class Player < ActiveRecord::Base

	validates :nome, :birthdate, :cpf, :descricao, :position, :cell_phone, :home_phone, presence: true

	@@positions = ["atacante", "goleiro", "zagueiro", "lateral_esquerdo", "lateral_direito"]
	def self.positions
		@@positions
	end
end
