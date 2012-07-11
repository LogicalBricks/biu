class CreateFotografias < ActiveRecord::Migration
  def change
    create_table :fotografias do |t|
      t.string :imagen
      t.string :titulo
      t.text :descripcion
      t.references :fotografiable, polymorphic: true
      t.timestamps
    end
  end
end
