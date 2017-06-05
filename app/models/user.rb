class User < ApplicationRecord
  belongs_to :soccer_team
	has_one :address
	accepts_nested_attributes_for :address
	before_save :is_active
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :update_vacancy_soccer_team

  validate :soccer_team_id, if: :can_sign_in?

  def can_sign_in?
    if self.soccer_team_id
      return self.soccer_team.vacancy_users > 0
    end
  end

  def update_vacancy_soccer_team
    binding.pry if Rails.env.environment?
    if self.soccer_team_id
      soccer = self.soccer_team
      soccer.vacancy_users = 11 - soccer.users.count
      soccer.save
    end
  end

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

	def is_active
		self.active = true if self.soccer_team_id
	end
end
