class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: 'Logado!'
    else
      redirect_to login_url, notice:"Informações invalidas"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Saída efetuada"
  end
end
