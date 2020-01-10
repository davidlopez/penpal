class CreateJournalEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :journal_entries do |t|
      t.text :entry
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
