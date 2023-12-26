module Api
  module V1
    module Users
      class RegistrationsController < Devise::RegistrationsController
        respond_to :json

        def create
          user = User.new(sign_up_params)
          if user.save
            render json: { user: UserSerializer.new(user), message: 'sign up success' }, status: :ok
          else
            render json: { message: 'Sign up failed' }, status: :unprocessable_entity
          end
        end

        private

        def sign_up_params
          params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
        end
      end
    end
  end
end
