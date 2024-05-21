# == Schema Information
#
# Table name: books
#
#  id                    :integer          not null, primary key
#  classifications_count :integer
#  description           :text
#  image_url             :string
#  isbn13                :integer
#  page_count            :integer
#  published_date        :string
#  publisher             :string
#  reviews_count         :integer
#  title                 :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  author_id             :integer
#
class Book < ApplicationRecord

  has_many  :reviews, class_name: "Review", foreign_key: "book_id", dependent: :destroy
  has_many  :classifications, class_name: "Classification", foreign_key: "book_id", dependent: :destroy
  belongs_to :author, required: true, class_name: "Author", foreign_key: "author_id", counter_cache: true

  def avg_rating
    reviews.average(:rating_numeric)
  end

end


