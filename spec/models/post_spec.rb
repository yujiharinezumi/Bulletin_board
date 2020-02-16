require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user_first)
  end

  it "textが空ならバリデーションが通らない" do
    post = Post.new(text: '',user_id: @user.id)
    expect(post).not_to be_valid
    end

  it "textが150文字以上ならバリデーションが通らない" do
    post = Post.new(text: 'a'*151, user_id: @user.id )
      expect(post).not_to be_valid
    end

  it "textが記載されている場合バリデーションが通る" do
    post = Post.new( text: 'hellohello',user_id: @user.id)
    expect(post).to be_valid
  end
end
