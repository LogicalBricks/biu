class CreateLocalizaciones < ActiveRecord::Migration
  def change
    create_table :localizaciones do |t|

      t.timestamps
    end
  end
end
