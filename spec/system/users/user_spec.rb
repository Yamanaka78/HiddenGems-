require 'rails_helper'

RSpec.describe 'ユーザー登録', type: :system do
  context '入力情報正常系' do
    it 'ユーザーが新規作成できること' do
      visit '/users/new'
      expect {
        fill_in 'user[name]', with: 'らんてっく'
        fill_in 'user[email]', with: 'example@example.com'
        fill_in 'user[password]', with: '12345678'
        fill_in 'user[password_confirmation]', with: '12345678'
        click_button 'メールアドレスで登録する'
        expect(page).to have_current_path("/", ignore_query: true)
      }.to change { User.count }.by(1)
    end
  end

  context '入力情報異常系' do
    it '必須フィールドが未入力のためユーザーが新規作成できない' do
      visit '/users/new'
      expect {
        fill_in 'user[email]', with: 'example@example.com'
        click_button 'メールアドレスで登録する'
      }.to change { User.count }.by(0)
    end
  end
end
