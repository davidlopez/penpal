class CreateTimePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :time_preferences do |t|
      t.boolean :morning, default: false 
      t.boolean :midday, default: false 
      t.boolean :before_bed, default: false 
      t.boolean :random, default: false 
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
