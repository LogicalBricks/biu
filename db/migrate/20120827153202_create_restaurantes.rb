class CreateRestaurantes < ActiveRecord::Migration
  def change
    create_table :restaurantes do |t|
      t.string :nombre
      t.string :resumen
      t.text :descripcion
      t.integer :clasificacion
      t.references :localidad
      t.string :telefono

      t.timestamps
    end
    add_index :restaurantes, :localidad_id
  end
end
