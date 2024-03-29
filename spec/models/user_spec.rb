require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'User create' do
    context 'User create completely' do
      it 'is valid perfectly' do
        expect(@user.valid?).to eq true
      end
    end
    context "doesn't create user" do
      it 'is invalid without a nickname' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors[:nickname]).to include("can't be blank")
      end

      it 'is invalid without a email' do
        @user.email = nil
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end

      it 'is invalid with a duplicate email' do
        first_user = FactoryBot.create(:user, email: 'test@gmail.com')
        second_user = FactoryBot.build(:user, email: 'test@gmail.com')
        second_user.valid?
        expect(second_user.errors[:email]).to include('has already been taken')
      end

      it 'is invalid without @ in email ' do
        @user.email = 'test.gmail.com'
        @user.valid?
        expect(@user.errors[:email]).to include('is invalid')
      end

      it 'is invalid without a password' do
        @user.password = nil
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end

      it 'is invalid that password is too short(minimum is 6 characters)' do
        @user.password = 'test'
        @user.valid?
        expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)')
      end

      it "is invalid that password doesn't include both letters and numbers" do
        @user.password = 'testuser'
        @user.valid?
        expect(@user.errors[:password]).to include('is invalid')
      end

      it 'is invalid without a password_confirmation' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "is invalid that password_confirmation doesn't match a password" do
        @user.password_confirmation = '1234test'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it 'is invalid without a first_name' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors[:first_name]).to include("can't be blank")
      end

      it 'returns a first_name as a Japanese' do
        @user.first_name = 'Test'
        @user.valid?
        expect(@user.errors[:first_name]).to include('is invalid')
      end

      it 'is invalid without a last_name' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors[:last_name]).to include("can't be blank")
      end

      it 'returns a last_name as a Japanese' do
        @user.last_name = 'User'
        @user.valid?
        expect(@user.errors[:last_name]).to include('is invalid')
      end

      it 'is invalid without a first_name_reading' do
        @user.first_name_reading = nil
        @user.valid?
        expect(@user.errors[:first_name_reading]).to include("can't be blank")
      end

      it 'is invalid with a first_name_reading is not full-width characters' do
        @user.first_name_reading = 'test'
        @user.valid?
        expect(@user.errors[:first_name_reading]).to include('is invalid')
      end

      it 'is invalid without a last_name_reading' do
        @user.last_name_reading = nil
        @user.valid?
        expect(@user.errors[:last_name_reading]).to include("can't be blank")
      end

      it 'is invalid with a last_name_reading is not full-width characters' do
        @user.last_name_reading = 'user'
        @user.valid?
        expect(@user.errors[:last_name_reading]).to include('is invalid')
      end

      it 'is invalid without a birth_day' do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors[:birth_day]).to include("can't be blank")
      end
    end
  end
end
