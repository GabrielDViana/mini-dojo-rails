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

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private
     def user_params
       params.require(:user).permit(:name, :age, :password, :email,
        :password_confirmation)
     end
end
