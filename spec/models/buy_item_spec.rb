require 'rails_helper'

RSpec.describe BuyItem, type: :model do

  let(:seller) { FactoryBot.create(:user) }
  let(:buyer) { FactoryBot.create(:user) }
  let(:item) {FactoryBot.create(:item, :with_image, user_id: seller.id)}
  let!(:pay) {FactoryBot.build(:buy_item, user_id: buyer.id, item_id: item.id)}

  describe "" do
    context "success to buy item" do
      it "fills in all address and card information foy buying" do
        expect(pay.valid?).to eq true
      end
    end
    context "failure to buy item" do
      it "is invalid without a card_token" do
        pay.token = nil
        pay.valid?
        expect(pay.errors[:token]).to include("can't be blank")
      end
      it "is invalid without a postal_code" do
        pay.postal_code = nil
        pay.valid?
        expect(pay.errors[:postal_code]).to include("can't be blank")
      end
      it "is invalid without a hyphen in postal_code" do
        pay.postal_code = '1234567'
        pay.valid?
        expect(pay.errors[:postal_code]).to include("is invalid")
      end
      it "is invalid if postal_code is not 7 numbers" do
        pay.postal_code = '1'
        pay.valid?
        expect(pay.errors[:postal_code]).to include("is invalid")
      end
      it "is invalid without a prefecture" do
        pay.prefecture = nil
        pay.valid?
        expect(pay.errors[:prefecture]).to include("can't be blank")
      end

      it "is invalid that prefecture must be other than 0" do
        pay.prefecture = 0
        pay.valid?
        expect(pay.errors[:prefecture]).to include("must be other than 0")
      end
      it "is invalid without a city" do
        pay.city = nil
        pay.valid?
        expect(pay.errors[:city]).to include("can't be blank")
      end
      it "is invalid without a address" do
        pay.address = nil
        pay.valid?
        expect(pay.errors[:address]).to include("can't be blank")
      end
      it "is invalid without a phone_number" do
        pay.phone_number = nil
        pay.valid?
        expect(pay.errors[:phone_number]).to include("can't be blank")
      end
      it "is invalid with a hyphen in phone_number" do
        pay.phone_number = '090-1234-5678'
        pay.valid?
        expect(pay.errors[:phone_number]).to include("is invalid")
      end
      it "is invalid that a phone_number is eleven or more" do
        pay.phone_number = '0901234567891234'
        pay.valid?
        expect(pay.errors[:phone_number]).to include("is invalid")
      end
      it "is invalid that a phone_number is eleven or less" do
        pay.phone_number = '090123'
        pay.valid?
        expect(pay.errors[:phone_number]).to include("is invalid")
      end
    end
  end
end
