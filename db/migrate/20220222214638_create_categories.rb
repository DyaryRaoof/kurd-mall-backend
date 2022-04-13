class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name_ku
      t.string :name_en

      t.timestamps
    end
  end
end
