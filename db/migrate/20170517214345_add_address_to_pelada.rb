class AddAddressToPelada < ActiveRecord::Migration[5.0]
  def change
    add_column :peladas, :address, :string
    add_column :peladas, :lat, :decimal
    add_column :peladas, :lng, :decimal
  end
end
