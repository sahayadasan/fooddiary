class CreateLog < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.date :date
      t.string :category
      t.string :name
      t.integer :servings
      t.integer :calories_per_serving
      t.timestamps
    end
  end
end
