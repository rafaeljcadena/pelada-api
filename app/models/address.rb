class Address < ApplicationRecord
  belongs_to :player, dependent: :destroy
  belongs_to :user, dependent: :destroy
  
  def as_json(options={})
    {
      street: street,
      complement: complement,
      cep: cep,
      city: city,
      state: state,
    }
  end

end
