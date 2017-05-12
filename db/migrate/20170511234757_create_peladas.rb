class CreatePeladas < ActiveRecord::Migration[5.0]
  def change
    create_table :peladas do |t|
      t.string :title
      t.datetime :begin

      t.timestamps
    end
  end
end
