class User < ApplicationRecord
  # has_one :address
  # accepts_nested_attributes_for :address
  before_save :is_active
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :soccer_team
  validate :soccer_team_id, if: :can_sign_in?

  validates :nome, :cell_phone, presence: true

  def can_sign_in?
    if self.soccer_team_id
      errors.add(:soccer_team_id, "#{soccer_team.team_name} ja esta completo. Escolha outro.") unless self.soccer_team.vacancy_users > 0
    end
  end

  @@positions = ["atacante", "goleiro", "zagueiro", "lateral_esquerdo", "lateral_direito"]
  def self.positions
    @@positions
  end

  validates :position, inclusion: {in: User.positions, allow_blank: true}

  # def update_vacancy_soccer_team
  #   if self.soccer_team_id
  #     soccer = SoccerTeam.find(self.soccer_team_id)
  #     # soccer.vacancy_users = 11 - soccer.users.count
  #     soccer.update(vacancy_users: (11 - soccer.users.count))
  #   end
  # end

  def as_json(options=nil)
    {
      id: id,
      nome: nome,
      email: email,
      birthdate: birthdate,
      cpf: cpf,
      active: active,
      position: I18n.t("model.user.positions.#{position}"),
      cell_phone: cell_phone,
      home_phone: home_phone,
      descricao: descricao,
      soccer_team_id: soccer_team_id,
      # address: address.as_json(),
      created_at: created_at
    }
  end

	def is_active
		self.active = self.soccer_team_id.present?
	end
end
