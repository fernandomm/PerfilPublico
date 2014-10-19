class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  around_action :redirect_not_found

  private

  def redirect_not_found
    yield
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url
  end
end
