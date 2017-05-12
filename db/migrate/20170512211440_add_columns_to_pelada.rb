class AddColumnsToPelada < ActiveRecord::Migration[5.0]
  def change
    add_column :peladas, :host_id, :integer
    add_column :peladas, :guest_id, :integer
    add_index :peladas, :guest_id
    add_index :peladas, :host_id
  end
end
