class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nome, :string
    add_column :users, :birthdate, :date
    add_column :users, :cpf, :string
    add_column :users, :descricao, :text
    add_column :users, :active, :boolean
    add_column :users, :position, :string
    add_column :users, :cell_phone, :string
    add_column :users, :home_phone , :string
  end
end
