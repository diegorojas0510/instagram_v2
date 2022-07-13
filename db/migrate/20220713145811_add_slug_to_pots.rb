class AddSlugToPots < ActiveRecord::Migration[7.0]
  def change
    add_column :pots, :slug, :string
    add_index :pots, :slug, unique: true # esta columna esta indexada por lo que la busqueda de los pots es mas eficiente
  end
end
