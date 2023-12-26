module Api
  module V1
    module Consumers
      class RegistrationsController < Devise::RegistrationsController
        respond_to :json

        private

        def respond_with(resource, _opts = {})
          if request.post? && resource.persisted?
            render json: { message: 'Signed up successfully.' }, status: :ok
          elsif request.delete?
            render json: { message: 'Account deleted successfully.' }, status: :ok
          else
            render json: {
              message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"
            }, status: :unprocessable_entity
          end
        end
      end
    end
  end
end
