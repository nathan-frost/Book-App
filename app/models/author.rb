# == Schema Information
#
# Table name: authors
#
#  id          :integer          not null, primary key
#  books_count :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Author < ApplicationRecord
  has_many  :books, class_name: "Book", foreign_key: "author_id", dependent: :destroy
end
