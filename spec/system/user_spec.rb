require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Users', type: :system do
  # describe '新規登録画面' do
  #   it '名前が空欄でエラーメッセージが出るテスト' do
  #     visit root_path
  #     fill_in('user_name', with: '')
  #     fill_in('user_email', with: 'a@gmail.com')
  #     fill_in('user_password', with: 'aaaaaa')
  #     fill_in('user_password_confirmation', with: 'aaaaaa')
  #     click_button 'commit'
  #     expect(page).to have_content('Nameを入力してください')
  #   end
  #
  #   it 'emailが空欄でエラーメッセージが出るテスト' do
  #     visit root_path
  #     fill_in('user_name', with: 'a')
  #     fill_in('user_email', with: '')
  #     fill_in('user_password', with: 'aaaaaa')
  #     fill_in('user_password_confirmation', with: 'aaaaaa')
  #     click_button 'commit'
  #     expect(page).to have_content('Emailを入力してください')
  #  end
  #
  #   it 'passwordが空欄でエラーメッセージが出るテスト' do
  #     visit root_path
  #     fill_in('user_name', with: 'a')
  #     fill_in('user_email', with: 'a@gmail.com')
  #     fill_in('user_password', with: '')
  #     fill_in('user_password_confirmation', with: 'aaaaaa')
  #     click_button 'commit'
  #     expect(page).to have_content('Passwordを入力してください')
  #   end
  #
  #   it 'password_confirmationが空欄でエラーメッセージが出るテスト' do
  #     visit root_path
  #     fill_in('user_name', with: 'a')
  #     fill_in('user_email', with: 'a@gmail.com')
  #     fill_in('user_password', with: 'aaaaaa')
  #     fill_in('user_password_confirmation', with: '')
  #     click_button 'commit'
  #     expect(page).to have_content('Password confirmationとPasswordの入力が一致しません')
  #   end
  #
  #   it 'ユーザーの新規登録のテスト' do
  #     visit root_path
  #     fill_in('user_name',with: 'a')
  #     fill_in('user_email', with: 'a@gmail.com')
  #     fill_in('user_password', with: 'aaaaaa')
  #     fill_in('user_password_confirmation', with: 'aaaaaa')
  #     click_button 'commit'
  #     expect(page).to have_content 'aのページ'
  #   end
  # end

  # describe 'ログインのテスト' do
  #   before do
  #     @user1 = FactoryBot.create(:user_first)
  #   end
  #
  #   it 'ログイン失敗のテスト' do
  #     visit new_session_path
  #     fill_in('session_email',with: "aa@example.com")
  #     fill_in('session_password', with:'aaaaaa')
  #     click_button 'commit'
  #     expect(page).to have_content 'ログインに失敗しました'
  #   end
  #
  #   it 'ログイン成功のテスト' do
  #     visit new_session_path
  #     log_in @user1
  #     expect(page).to have_content '掲示板一覧'
  #   end
  #
  #   it 'ログアウトのテスト' do
  #     log_in @user1
  #     click_on 'Logout'
  #     expect(page).to have_content 'ログアウトしました'
  #   end
  # end

  describe 'ユーザーの編集、更新のテスト' do
    before do
      @user1 = FactoryBot.create(:user_first)
      @user2 = FactoryBot.create(:user_second)
    end

    it 'ユーザーの詳細画面に遷移するテスト' do
      log_in @user1
      click_on 'Profile'
      expect(page).to have_content 'aのページ'
    end

    it 'ユーザーの編集するテスト' do
      log_in @user1
      click_on 'Profile'
      click_on 'プロフィールの編集'
      page.driver.browser.switch_to.alert.accept
      fill_in('user_name',with: "aaaaaa")
      fill_in('user_password',with: "aaaaaa")
      fill_in('user_password_confirmation',with: "aaaaaa")
      click_button 'commit'
      expect(page).to have_content 'ユーザー情報を編集しました！'
      click_on 'Profile'
      expect(page).to have_content 'aaaaaaのページ'
    end

    it 'ユーザーの削除するテスト' do
      log_in @user1
      click_on 'Profile'
      click_on 'アカウントの削除'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'アカウントを削除しました！'
    end
  end
end
