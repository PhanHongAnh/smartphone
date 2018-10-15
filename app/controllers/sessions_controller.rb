class SessionsController < ApplicationController
  before_action :find_user, only: :create

  def new
  end

  def create
    if check_user
      log_in @user
      flash.now[:success] = "ログインに成功しました"
      redirect_to root_url
    else
      flash.now[:danger] = "ログインエラー"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  def find_user
    @user = User.find_by email: params[:session][:email].downcase
    return if @user
    flash.now[:danger] = "ユーザーを見つけることができません"
    render :new
  end

  def check_user
    @user&.authenticate params[:session][:password]
  end
end
