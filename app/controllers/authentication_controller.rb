require_relative '../../lib/json_web_token'

class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    params.require([:identity, :password])
    @user = User.find_by_email(params[:identity]) if identity_is_email?
    @user = User.find_by_username(params[:identity]) if identity_is_username? and not @user.present?
    if @user&.authenticate(params[:password])
      token = ::JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

end
