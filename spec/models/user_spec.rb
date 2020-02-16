require 'rails_helper'

RSpec.describe User, type: :model do
  it "nameが空ならバリデーションが通らない" do
    user = User.new(name: '', email: 'test@gmail.com', password: '111111')
    expect(user).not_to be_valid
  end

  it "nameが30文字以上ならバリデーションが通らない" do
    user = User.new(name: 'a'*31, email: 'test@gmail.com', password: '111111')
    expect(user).not_to be_valid
  end

  it "emailが空ならバリデーションが通らない" do
    user = User.new(name: 'テスト', email: '', password: '111111')
    expect(user).not_to be_valid
  end

  it "emailが形式が違ったらバリデーションが通らない" do
    user = User.new(name: 'テスト', email: 'testtest', password: '111111')
    expect(user).not_to be_valid
  end

  it "emailが大文字でもバリデーションが通る" do
    user = User.new(name: 'テスト', email: 'TEST@gmail.com', password: '111111')
    expect(user).to be_valid
  end

  it "passwordが6文字以下ならバリデーションが通らない" do
    user = User.new(name: 'テスト', email: 'testtest@t.com', password: '1')
    expect(user).not_to be_valid
  end
end
