class AddSurveyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :survey?, :boolean, default: false
  end
end
