class CreateLocalizaciones < ActiveRecord::Migration
  def change
    create_table :localizaciones do |t|
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
      t.references :localizable, polymorphic: true
      t.timestamps
    end
  end
end
