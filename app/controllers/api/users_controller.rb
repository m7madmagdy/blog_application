module Api
  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_user, only: %i[show edit update destroy]

    CACHE_KEY = 'users#cached'

    after_action :cache_response, only: [:index]
    before_action :check_cached, only: [:index]

    def index
      @users ||= User.all.order('Random()')
    end

    def show; end

    def new
      @user = User.new
    end

    def create
      @user = User.new user_params
      if @user.save
        redirect_to @user, status: :created
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @user.update(user_params)
        redirect_to @user
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @user.destroy
        head :no_content, status: :ok
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :mobile, :status)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def cache_response
      REDIS_CLIENT.set CACHE_KEY, response.body
    end

    def check_cached
      cached_users = REDIS_CLIENT.get(CACHE_KEY)
      return unless cached_users

      parced_response = JSON.parse(cached_users)
      @users = parced_response.map { |user_object| User.new(user_object)  }
    end
  end
end
