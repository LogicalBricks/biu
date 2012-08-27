class CreateHoteles < ActiveRecord::Migration
  def change
    create_table :hoteles do |t|
      t.string :nombre
      t.string :resumen
      t.text :descripcion
      t.integer :clasificacion
      t.integer :total_habitaciones
      t.references :localidad
      t.decimal :costo
      t.string :telefono

      t.timestamps
    end
    add_index :hoteles, :localidad_id
  end
end
