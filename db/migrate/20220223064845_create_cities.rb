class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name_en
      t.string :name_ku

      t.timestamps
    end
  end
end
