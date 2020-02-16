FactoryBot.define do
  factory :category_first,class: Category do
    name { "HTML" }
  end

  factory :category_second,class: Category do
    name { "CSS" }
  end

  factory :category_third,class: Category do
    name { "JavaScript" }
  end
end
