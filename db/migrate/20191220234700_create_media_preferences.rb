class CreateMediaPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :media_preferences do |t|
      t.boolean :dogs, default: false
      t.boolean :cats, default: false
      t.boolean :babies, default: false
      t.boolean :landscapes, default: false
      t.boolean :celestial, default: false
      t.boolean :animals, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
