require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "User create" do
    context "User create completely" do
      it "is valid perfectly" do
        expect(@user.valid?).to eq true
      end
      it "is invalid without a nickname" do
        user = User.new(nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end
      it "is invalid without a email" do
        user = User.new(email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
      it "is invalid without a password" do
        user = User.new(password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
      it "is invalid without a birth_day" do
        user = User.new(birth_day: nil)
        user.valid?
        expect(user.errors[:birth_day]).to include("can't be blank")
      end
      it "is invalid without a first_name" do
        user = User.new(first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
      end
      it "is invalid without a last_name" do
        user = User.new(last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include("can't be blank")
      end
      it "is invalid without a first_name_reading" do
        user = User.new(first_name_reading: nil)
        user.valid?
        expect(user.errors[:first_name_reading]).to include("can't be blank")
      end
      it "is invalid without a last_name_reading" do
        user = User.new(last_name_reading: nil)
        user.valid?
        expect(user.errors[:last_name_reading]).to include("can't be blank")
      end
    end
  end
end
