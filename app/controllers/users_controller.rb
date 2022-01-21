class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      set_user_session
      flash[:success] = "Welcome to the app, #{@user.name}!"
      redirect_to root_path
    else
      render :new
    end
  end

  def login
    if user_signed_in?
      redirect_to root_path
    end
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

  private

  def set_user_session
    session[:user_id] = @user.id
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end