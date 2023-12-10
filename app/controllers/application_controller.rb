class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found(exception)
    render json: { message: I18n.t('errors.not_fount', model: exception.model) }, status: :not_found
  end

  def page
    @page = params[:page]
  end

  def page_size
    @page_size = params[:page_size]
  end
end
