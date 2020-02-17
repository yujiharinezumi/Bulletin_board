FactoryBot.define do
  factory :categorize_first,class: Categorize do
    post_id { Post.first.id }
    category_id { Category.first.id }
  end
end
