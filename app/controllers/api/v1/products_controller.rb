module Api
  module V1
    class ProductsController < ApplicationController
      def index
        render json: Product.active.page(page).per(page_size), each_serializer: ProductSerializer
      end

      def show
        render json: Product.find(params['id']), serializer: ProductSerializer
      end
    end
  end
end
