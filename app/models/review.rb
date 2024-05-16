# == Schema Information
#
# Table name: reviews
#
#  id             :integer          not null, primary key
#  rating_numeric :integer
#  review         :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  book_id        :integer
#  reviewer_id    :integer
#
class Review < ApplicationRecord
  belongs_to :reviewer, required: true, class_name: "User", foreign_key: "reviewer_id", counter_cache: true
  belongs_to :book, required: true, class_name: "Book", foreign_key: "book_id", counter_cache: true

end
