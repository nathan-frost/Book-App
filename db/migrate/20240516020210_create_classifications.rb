class CreateClassifications < ActiveRecord::Migration[7.0]
  def change
    create_table :classifications do |t|
      t.integer :book_id
      t.integer :category_id

      t.timestamps
    end
  end
end
