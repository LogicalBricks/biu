class CreateTransportes < ActiveRecord::Migration
  def change
    create_table :transportes do |t|
      t.string :nombre
      t.string :resumen
      t.text :descripcion
      t.integer :clasificacion
      t.references :localidad
      t.string :telefono
      t.text :horarios

      t.timestamps
    end
    add_index :transportes, :localidad_id
  end
end
