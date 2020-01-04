# frozen_string_literal: true

module Apps
  # Controls the user apps
  class AppsController < ApplicationController
    before_action :authorize_request, except: :show
    before_action :set_app, except: %i[show my_apps]

    def show
      render json: App.all, status: :ok
    end

    def my_apps
      render json: @current_user.apps, status: :ok
    end

    def authorize
      @current_user.apps << @app unless @current_user.apps.include? @app
      render json: @current_user.apps, status: :ok
    end

    def unauthorize
      @current_user.apps.delete(@app) if @current_user.apps.include? @app
      render json: @current_user.apps, status: :ok
    end

    private

    def set_app
      @app = App.find(params[:app_id])
    end
  end
end
