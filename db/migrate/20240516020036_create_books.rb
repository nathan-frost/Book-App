class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :published_date
      t.integer :isbn13
      t.integer :page_count
      t.string :image_url
      t.string :publisher
      t.integer :author_id
      t.integer :reviews_count
      t.integer :classifications_count

      t.timestamps
    end
  end
end
