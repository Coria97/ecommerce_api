# frozen_string_literal: true
module Api
  module V1
    module Consumers
      class SessionsController < Devise::SessionsController
        skip_before_action :verify_authenticity_token, only: [:create]
        respond_to :json

        before_action :consumer_resource, only: :create
        #before_action :authenticate_user!

        def create
          if @consumer_resource&.valid_password?(params.dig(:consumer, :password))
            sign_in(resource_name, @consumer_resource)
            render json:
            {
              access_token: current_token,
              message:      'Logged in successfully.'
            }, status: :ok
          else
            render json: { message: 'Invalid email or password.' }, status: :unauthorized
          end
        end

        #def destroy
        #  byebug
        #  sign_out(current_user)
        #  render json: { message: 'logged out successfully' }, status: :ok
        #end

        private

        def consumer_resource
          @consumer_resource = Consumer.find_for_database_authentication(email: params.dig(:consumer, :email))
        end

        def current_token
          request.env['warden-jwt_auth.token']
        end

        def respond_to_on_destroy
          byebug
          if current_user
            render json: {
              status: 200,
              message: "logged out successfully"
            }, status: :ok
          else
            render json: {
              status: 401,
              message: "Couldn't find an active session."
            }, status: :unauthorized
          end
        end
      end
    end
  end
end
