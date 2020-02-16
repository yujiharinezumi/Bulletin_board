FactoryBot.define do
  factory :user_first,class: User do
    name { 'a' }
    email { 'a@gmail.com' }
    password {'aaaaaa'}
    password_confirmation {'aaaaaa'}
  end

  factory :user_second,class: User do
    name { 'b' }
    email { 'b@gmail.com' }
    password {'aaaaaa'}
    password_confirmation {'aaaaaa'}
  end

  factory :user_third,class: User do
    name { 'c' }
    email { 'c@gmail.com' }
    password {'aaaaaa'}
    password_confirmation {'aaaaaa'}
  end
end
