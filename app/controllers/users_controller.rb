class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.role = 1
    if @user.save
      set_user_session
      flash[:success] = "Welcome to the app, #{@user.name}!"
      redirect_to root_path
    else
      render :new
    end
  end

  def login
  end

  def auth
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      set_user_session
      redirect_to root_path
    else
    flash.now[:warning] = t '.invalid_creds'
    render :login
    end
  end

  def logout
    sign_out
    redirect_to root_path
  end

  private

  def set_user_session
    sign_in @user
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end