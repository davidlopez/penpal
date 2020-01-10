class CreateResourcePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :resource_preferences do |t|
      t.boolean :music, default: false
      t.boolean :activity, default: false
      t.boolean :buddy, default: false
      t.boolean :media, default: false
      t.boolean :journal, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
