# frozen_string_literal: true

class Consumers::RegistrationsController < Devise::RegistrationsController
  respond_to :json
end
