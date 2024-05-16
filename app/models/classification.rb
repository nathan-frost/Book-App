# == Schema Information
#
# Table name: classifications
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  book_id     :integer
#  category_id :integer
#
class Classification < ApplicationRecord
  belongs_to :book, required: true, class_name: "Book", foreign_key: "book_id", counter_cache: true
  belongs_to :category, required: true, class_name: "Category", foreign_key: "category_id", counter_cache: true
end
