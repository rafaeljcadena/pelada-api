class User < ApplicationRecord
  belongs_to :soccer_team
	has_one :address, dependent: :destroy
	accepts_nested_attributes_for :address
	before_save :is_active?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def as_json(options=nil)
    {
      nome: nome,
      email: email,
      birthdate: birthdate,
      cpf: cpf,
      active: active,
      position: position,
      cell_phone: cell_phone,
      home_phone: home_phone,
      descricao: descricao,
      address: address.as_json(),
      created_at: created_at
    }
  end

	def is_active?
		self.active = true if self.soccer_team_id
	end
end
