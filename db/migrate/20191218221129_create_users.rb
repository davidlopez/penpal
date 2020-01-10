class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :google_token 
      t.string :spotify_token
      t.string :email

      t.timestamps
    end
  end
end
