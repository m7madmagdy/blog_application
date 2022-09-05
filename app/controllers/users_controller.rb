class UsersController < ApplicationController
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
      redirect_to @user, notice: "Added new user successfully."
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "Updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, alert: "Destroyed successfully."
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :mobile)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
