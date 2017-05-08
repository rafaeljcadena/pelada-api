class Address < ApplicationRecord
  belongs_to :player, dependent: :destroy
end
