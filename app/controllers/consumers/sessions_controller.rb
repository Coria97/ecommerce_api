# frozen_string_literal: true

class Consumers::SessionsController < Devise::SessionsController
  respond_to :json
end
