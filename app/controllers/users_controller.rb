class UsersController < ApplicationController
  
  def new
    @user = User.new
    profile = @user.profiles.build
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url
      flash[:success] = "Thanks for signing up! Please check your email to activate your account."
    else
      render :new
    end
  end
  
  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      redirect_to root_url
      flash[:success] = "User was successfully activated."
    else
      not_authenticated
    end
  end

end
