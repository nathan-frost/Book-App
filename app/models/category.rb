# == Schema Information
#
# Table name: categories
#
#  id                    :integer          not null, primary key
#  classifications_count :integer
#  name                  :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class Category < ApplicationRecord
  has_many  :classifications, class_name: "Classification", foreign_key: "category_id", dependent: :destroy
end
