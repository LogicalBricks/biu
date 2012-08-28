class CreateEmergencias < ActiveRecord::Migration
  def change
    create_table :emergencias do |t|
      t.string :nombre
      t.string :resumen
      t.text :descripcion
      t.references :localidad
      t.string :telefono
      t.string :tipo

      t.timestamps
    end
    add_index :emergencias, :localidad_id
  end
end
