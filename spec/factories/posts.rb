FactoryBot.define do
  factory :post_first,class: Post do
    text { 'AAA' }
  end

  factory :post_second,class: Post do
    text { 'BBB' }
  end

  factory :post_third,class: Post do
    text { 'CCC' }
  end
end
