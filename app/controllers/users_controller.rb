class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def random_user
    GenerateRandomUserJob.perform_later
    redirect_to root_path
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'Added new user Successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'Updated Successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, alert: 'Destroyed Successfully.'
  end

  def destroy_all
    User.all.destroy_all
    redirect_to root_path, alert: 'All Users Destroyed Successfully.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :url, :mobile)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
