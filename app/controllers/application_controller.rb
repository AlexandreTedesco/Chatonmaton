# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ItemsHelper
  include CartsHelper
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name description])
  end
end
