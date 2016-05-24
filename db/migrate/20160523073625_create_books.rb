class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :description
      t.integer :cost
      t.integer :book_condition_id
      t.timestamps null: false
    end
  end
end
