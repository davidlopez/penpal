class CreateDbtQuote < ActiveRecord::Migration[5.2]
  def change
    create_table :dbt_quotes do |t|
      t.text :quote

      t.timestamps
    end
  end
end
