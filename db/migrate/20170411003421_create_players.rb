class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.date :birthdate
      t.string :cpf
      t.text :descricao
      t.boolean :active
      t.string :position
      t.string :cell_phone
      t.string :home_phone

      t.timestamps
    end
  end
end
