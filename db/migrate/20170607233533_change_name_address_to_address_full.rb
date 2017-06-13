class ChangeNameAddressToAddressFull < ActiveRecord::Migration[5.0]
  def change
  	rename_column :peladas, :address, :address_full
  end
end
