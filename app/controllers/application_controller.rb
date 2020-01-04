# frozen_string_literal: true

require_relative '../../lib/json_web_token'

# Main class
class ApplicationController < ActionController::API

  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = ::JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  private

  def identity_is_email?
    URI::MailTo::EMAIL_REGEXP.match(params[:identity])
  end

  def identity_is_username?
    User::VALID_USERNAME_REGEX.match(params[:identity])
  end
end
