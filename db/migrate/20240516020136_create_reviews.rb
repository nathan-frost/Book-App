class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :reviewer_id
      t.integer :rating_numeric
      t.text :review
      t.integer :book_id

      t.timestamps
    end
  end
end
