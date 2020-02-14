class Category < ApplicationRecord
  has_many :categorizes, dependent: :destroy
  has_many :posts, through: :categorize
end
