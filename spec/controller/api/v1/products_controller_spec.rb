# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  describe 'GET /index' do
    context 'when the service response 200' do
      before do
        FactoryBot.create_list(:product, 10)
        get :index, params: { page: 1, page_size: 2 }
      end

      it_behaves_like 'successful response' do
        let(:expected_keys) do
          %i[id name description price stock_quantity weight dimensions active]
        end
      end

      it 'returns the expected number of paginated products' do
        expect(response_body.count).to eq(2)
      end

      it 'returns all products when not paginated' do
        get :index

        expect(response_body.count).to eq(Product.count)
      end
    end
  end

  describe 'GET /show' do
    context 'when the service response 200' do
      let(:product) { FactoryBot.create(:product) }

      before do
        get :show, params: { id: product.id }
      end

      it_behaves_like 'successful response' do
        let(:expected_keys) do
          %i[id name description price stock_quantity weight dimensions active]
        end
      end
    end

    context 'when the service response 404' do
      before do
        get :show, params: { id: 2 }
      end

      it_behaves_like 'failed response'
    end
  end
end

# rubocop:enable Metrics/BlockLength
