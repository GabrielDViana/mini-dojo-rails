class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      cookies[:auth_token] = user.auth_token
      redirect_to user
      flash[:success] = 'Logado com sucesso!'
    else
      redirect_to login_url
      flash[:error] ="Usuário inexistente ou senha incorreta"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url
  end

end
