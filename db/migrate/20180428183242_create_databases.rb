class CreateDatabases < ActiveRecord::Migration[5.1]
  def change
    create_table :databases do |t|
      t.string :name
      t.date :date
      t.integer :number
      t.string :description

      t.timestamps
    end
  end
end
