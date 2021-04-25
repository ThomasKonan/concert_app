class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, if: -> { request.format.html? }
  require "songkickr"
  # require "setlisftfm"

  def current_user
    auth_headers = request.headers["Authorization"]
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: "HS256" }
        )
        User.find_by(id: decoded_token[0]["user_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_user

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end
end

# remote = Songkickr::Remote.new API_KEY
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.

# def current_user
#   @current_user ||= User.find(session[:user_id]) if session[:user_id]
# end

# helper_method :current_user

# def authorize
#   redirect_to "/login" unless current_user
#   # end
#   attr_reader :sk, :per_page

#   # def initialize
#   #   @@sk = Songkickr::Remote.new config.songkick_api[:api_key]
#   #   @per_page = 100
#   # end

#   def index
#   end

#   def search
#     sk.location_search build_query(params)
#   end
# end
