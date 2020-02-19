require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Comments', type: :system do
  before do
    @user1 = FactoryBot.create(:user_first)
    @user2 = FactoryBot.create(:user_second)
    @post3 = FactoryBot.create(:post_first, user_id: @user2.id)
    log_in @user1
  end

  it '投稿にコメントをするテスト' do
    click_on "詳細を確認する"
    fill_in('comment_content',with:"hello")
    click_on 'commit'
    expect(page).to have_content('hello')
  end

  it '自分のコメントを編集して更新するテスト' do
    click_on "詳細を確認する"
    fill_in('comment_content',with:"hello")
    click_on 'commit'
    click_on 'Edit'
    fill_in('edit_comment',with:"こんにちは")
    click_on '更新する'
    expect(page).to have_content('こんにちは')
  end

  it '自分のコメントを編集が失敗するテスト' do
    click_on "詳細を確認する"
    fill_in('comment_content',with:"hello")
    click_on 'commit'
    click_on 'Edit'
    fill_in('edit_comment',with:"")
    click_on '更新する'
    expect(page).to have_content('内容を入力してください')
  end

  it 'コメントを削除するテスト' do
    click_on "詳細を確認する"
    fill_in('comment_content',with:"hello")
    click_on 'commit'
    click_on 'Destroy'
    expect(page).not_to have_content('hello')
  end
end
