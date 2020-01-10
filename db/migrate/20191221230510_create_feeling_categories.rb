class CreateFeelingCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :feeling_categories do |t|
      t.string :category
      t.references :user, foreign_key: true
      t.references :feeling_preference, foreign_key: true

      t.timestamps
    end
  end
end
