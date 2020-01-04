# frozen_string_literal: true

# Handles users actions
class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index self]

  def self
    render json: @current_user.sanitized_info, status: :ok
  end

  # GET /users
  def index
    @users = User.all.map(&:sanitized_info)
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user.sanitized_info, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user.sanitized_info, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find_by_username!(params[:_username])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(:first_name,
                  :last_name,
                  :username,
                  :email,
                  :password,
                  :password_confirmation)
  end
end
