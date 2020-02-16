require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Users', type: :system do
  describe '新規登録画面' do
    it '名前が空欄でエラーメッセージが出るテスト' do
      visit root_path
      fill_in('user_name', with: '')
      fill_in('user_email', with: 'a@gmail.com')
      fill_in('user_password', with: 'aaaaaa')
      fill_in('user_password_confirmation', with: 'aaaaaa')
      click_button 'commit'
      expect(page).to have_content('Nameを入力してください')
    end

    it 'emailが空欄でエラーメッセージが出るテスト' do
      visit root_path
      fill_in('user_name', with: 'a')
      fill_in('user_email', with: '')
      fill_in('user_password', with: 'aaaaaa')
      fill_in('user_password_confirmation', with: 'aaaaaa')
      click_button 'commit'
      expect(page).to have_content('Emailを入力してください')
   end

    it 'passwordが空欄でエラーメッセージが出るテスト' do
      visit root_path
      fill_in('user_name', with: 'a')
      fill_in('user_email', with: 'a@gmail.com')
      fill_in('user_password', with: '')
      fill_in('user_password_confirmation', with: 'aaaaaa')
      click_button 'commit'
      expect(page).to have_content('Passwordを入力してください')
    end

    it 'password_confirmationが空欄でエラーメッセージが出るテスト' do
      visit root_path
      fill_in('user_name', with: 'a')
      fill_in('user_email', with: 'a@gmail.com')
      fill_in('user_password', with: 'aaaaaa')
      fill_in('user_password_confirmation', with: '')
      click_button 'commit'
      expect(page).to have_content('Password confirmationとPasswordの入力が一致しません')
    end

    it 'ユーザーの新規登録のテスト' do
      visit root_path
      fill_in('user_name',with: 'a')
      fill_in('user_email', with: 'a@gmail.com')
      fill_in('user_password', with: 'aaaaaa')
      fill_in('user_password_confirmation', with: 'aaaaaa')
      click_button 'commit'
      expect(page).to have_content 'aのページ'
    end

  end
end
