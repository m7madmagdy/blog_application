module Api
  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_user, only: %i[show edit update destroy]

    def index
      @users = User.all
    end
  
    def show; end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
  
      if @user.save
        redirect_to @user 
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
      @user.destroy
      redirect_to users_url, notice: "User was successfully destroyed."
    end
  
    private 

    def user_params
      params.require(:user).permit(:name, :email, :mobile)
    end
  
    def set_user
      @user = User.find(params[:id])
    end
  end
  
end