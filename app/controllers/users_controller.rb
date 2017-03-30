class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
      @user = User.new
  end

  def show
      @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to action: "index"
  end

  private
     def set_user
       @user = User.find(params[:id])
     end

  private
     def user_params
       params.require(:user).permit(:name, :age)
     end
end
