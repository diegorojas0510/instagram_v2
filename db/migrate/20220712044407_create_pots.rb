class CreatePots < ActiveRecord::Migration[7.0]
  def change
    create_table :pots do |t|
      t.string :name
      t.string :description
      t.boolean :visible, default: true

      t.timestamps # created_at & update_at por default rails las pone
    end
  end
end
