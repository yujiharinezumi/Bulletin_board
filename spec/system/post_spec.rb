require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Posts', type: :system do
  before do
    @user1 = FactoryBot.create(:user_first)
    @post1 = FactoryBot.create(:post_first, user_id: @user1.id)
    @category1 =  FactoryBot.create(:category_first)
    @categorize1 = FactoryBot.create(:categorize_first)
    log_in @user1
  end

  it 'ユーザーが投稿するテスト' do
    click_on "掲示板投稿する"
    fill_in('post_text',with:"hello")
    click_on 'commit'
    expect(page).to have_content('hello')
  end

  it '投稿失敗するテスト' do
    click_on "掲示板投稿する"
    fill_in('post_text',with:"")
    click_on 'commit'
    expect(page).to have_content('Textを入力してください')
  end

  it '投稿の編集が失敗するテスト' do
    click_on "投稿の編集する"
    page.driver.browser.switch_to.alert.accept
    fill_in('post_text',with:"bbbbbbb")
    click_on 'commit'
    expect(page).to have_content('投稿を編集しました。')
    expect(page).to have_content('bbbbbbb')
  end

  it 'ユーザーが投稿を削除するテスト' do
    click_on "投稿を削除する"
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('投稿を削除しました。')
    expect(page).not_to have_content('AAA')
  end

  it 'ユーザーが投稿を検索失敗テスト' do
    fill_in('post_text',with:"BBB")
    click_on 'search'
    expect(page).not_to have_content('AAA')
  end

  it 'ユーザーが投稿を検索成功テスト' do
    fill_in('post_text',with:"A")
    click_on 'search'
    expect(page).to have_content('AAA')
  end

  it 'ユーザーが投稿を検索成功テスト' do
    fill_in('post_text',with:"A")
    click_on 'search'
    expect(page).to have_content('AAA')
  end
end
