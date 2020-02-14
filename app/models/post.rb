class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :categorizes, dependent: :destroy
  has_many :categories, through: :categorizes
  validates :text, presence: true

  def self.search(search)
    search ? where('text LIKE ?', "%#{search}%") : all
  end
end
