class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :categorizes, dependent: :destroy
  has_many :categories, through: :categorizes
  validates :text, presence: true

  # def self.search(search)
  #   search ? where('text LIKE ?', "%#{search}%") : all
  # end
  scope :text_search, -> (text) {
    next if text.blank?
    where("text LIKE ?", "%#{text}%")
  }

  scope :category_search, ->(category_ids){
   next if category_ids.blank?
   #ラベルがある時(false)
   joins(:categories).where(categories: { id: category_ids }).group(:id)}
end
