class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  USERS = { "rareshare" => "Rareshare2015!!" }

  before_filter :authenticate

  def authenticate
    if Rails.env.production?
      authenticate_or_request_with_http_digest("Application") do |name|
        USERS[name]
      end
    end
  end
end
