class ChanginColumnActiveToPlayer < ActiveRecord::Migration[5.0]
  def change
  	change_column :players, :active, :boolean, default: false
  end
end
