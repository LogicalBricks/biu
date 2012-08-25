class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :nombre
      t.text :resumen
      t.text :descripcion
      t.string :lugar
      t.datetime :fecha_y_hora
      t.float :costo
      t.references :localidad

      t.timestamps
    end
  end
end
