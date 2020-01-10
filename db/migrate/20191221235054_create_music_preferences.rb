class CreateMusicPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :music_preferences do |t|
      t.string :genre
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
