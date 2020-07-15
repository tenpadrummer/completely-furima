require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item, :with_image, user_id: user.id) }

  describe 'item create' do
    context 'create item completely' do
      it 'is valid perfectly' do
        expect(item.valid?).to eq true
      end
    end
    context "doesn't create item" do
      it 'is invalid without a name' do
        item.name = nil
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end

      it 'is invalid without a image' do
        item.image = nil
        item.valid?
        expect(item.errors[:image]).to include("can't be blank")
      end

      it 'is invalid without a price' do
        item.price = nil
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
      end

      it 'is invalid without a description' do
        item.description = nil
        item.valid?
        expect(item.errors[:description]).to include("can't be blank")
      end

      it 'is invalid without a scheduled_delivery_id' do
        item.scheduled_delivery_id = nil
        item.valid?
        expect(item.errors[:scheduled_delivery_id]).to include("can't be blank")
      end

      it 'is invalid that scheduled_delivery_id must be other than 0' do
        item.scheduled_delivery_id = 0
        item.valid?
        expect(item.errors[:scheduled_delivery_id]).to include('must be other than 0')
      end

      it 'is invalid without a shipping_fee_status_id' do
        item.shipping_fee_status_id = nil
        item.valid?
        expect(item.errors[:shipping_fee_status_id]).to include("can't be blank")
      end

      it 'is invalid that shipping_fee_status_id must be other than 0' do
        item.shipping_fee_status_id = 0
        item.valid?
        expect(item.errors[:shipping_fee_status_id]).to include('must be other than 0')
      end

      it 'is invalid without a prefecture_id' do
        item.prefecture_id = nil
        item.valid?
        expect(item.errors[:prefecture_id]).to include("can't be blank")
      end

      it 'is invalid that prefecture_id must be other than 0' do
        item.prefecture_id = 0
        item.valid?
        expect(item.errors[:prefecture_id]).to include('must be other than 0')
      end

      it 'is invalid without a sales_status_id' do
        item.sales_status_id = nil
        item.valid?
        expect(item.errors[:sales_status_id]).to include("can't be blank")
      end

      it 'is invalid that sales_status_id must be other than 0' do
        item.sales_status_id = 0
        item.valid?
        expect(item.errors[:sales_status_id]).to include('must be other than 0')
      end

      it 'is invalid without a category_id' do
        item.category_id = nil
        item.valid?
        expect(item.errors[:category_id]).to include("can't be blank")
      end

      it 'is invalid that category_id must be other than 0' do
        item.category_id = 0
        item.valid?
        expect(item.errors[:category_id]).to include('must be other than 0')
      end

      it 'is invalid that price is not included in 300..9999999' do
        item.price = 299
        item.valid?
        expect(item.errors[:price]).to include('is not included in the list')
      end
    end
  end
end
