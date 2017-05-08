class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :complement
      t.string :cep
      t.string :city
      t.string :state
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
