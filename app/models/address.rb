class Address < ApplicationRecord
  belongs_to :player, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
