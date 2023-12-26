# frozen_string_literal: true
module Api
  module V1
    module Users
      class SessionsController < Devise::SessionsController
        skip_before_action :verify_authenticity_token, only: [:create]
        respond_to :json

        before_action :user_resource, only: :create
        #before_action :authenticate_user!

        def create
          if @user_resource&.valid_password?(params.dig(:user, :password))
            sign_in(resource_name, @user_resource)
            render json:
            {
              access_token: current_token,
              message:      'Logged in successfully.'
            }, status: :ok
          else
            render json: { message: 'Invalid email or password.' }, status: :unauthorized
          end
        end

        def destroy
          sign_out(current_user)
          render json: { message: 'logged out successfully' }, status: :ok
        end

        private

        def user_resource
          @user_resource = User.find_for_database_authentication(email: params.dig(:user, :email))
        end

        def current_token
          request.env['warden-jwt_auth.token']
        end
      end
    end
  end
end
