module SystemHelper
  def login_as_general
    general_user = create(:user)
    visit root_path
    find('.header-menu').click
    click_link "ログイン"
    fill_in 'email', with: general_user.email
    fill_in 'password', with: '12345678'
    click_button 'ログイン'
  end
end

RSpec.configure do |config|
  config.include SystemHelper
end
