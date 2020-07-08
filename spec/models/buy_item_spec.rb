require 'rails_helper'

RSpec.describe BuyItem, type: :model do
  # before do
  #   @seller = FactoryBot.create(:user)
  #   @buyer = FactoryBot.create(:user)
  #   @item = FactoryBot.create(:user, user_id: seller.id)
  #   @buy_item = FactoryBot.create(:buy_item, user_id: buyer.id, item_id: @item.id)
  # end

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

    end
  end

end
