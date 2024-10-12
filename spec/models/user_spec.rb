require 'rails_helper'

RSpec.describe User, type: :model do
  it '名前namae、メールがあり、パスワードは3文字以上であれば有効であること' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'メールはユニークであること' do
    user1 = create(:user)
    user2 = build(:user)
    user2.email = user1.email
    user2.valid?
    expect(user2.errors[:email]).to include('has already been taken')
  end

  it 'メールアドレス姓名は必須項目であること' do
    user = build(:user)
    user.name = nil
    user.email = nil
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
    expect(user.errors[:email]).to include("can't be blank")
  end

  it '姓名は255文字以下であること' do
    user = build(:user)
    user.name = "a" * 256
    user.valid?
    expect(user.errors[:name]).to include('is too long (maximum is 255 characters)')
  end
end
