class CreateLugares < ActiveRecord::Migration
  def change
    create_table :lugares do |t|
      t.string :nombre
      t.text :resumen
      t.text :descripcion

      t.timestamps
    end
  end
end
