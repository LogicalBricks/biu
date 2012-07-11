class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :nombre
      t.text :resumen
      t.text :descripcion
      t.datetime :fecha_y_hora
      t.string :costo

      t.timestamps
    end
  end
end