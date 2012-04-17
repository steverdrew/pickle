class UsersController < ApplicationController
  
  before_filter :require_no_user, :only => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url
      flash[:success] = "Thanks for signing up! Please check your email (including spam folders) to activate your account."
    else
      render :new
    end
  end
  
  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to root_url
      flash[:success] = "User was successfully activated."
    else
      not_authenticated
    end
  end

  def edit
    require_login
    @user = current_user
  end
  
  def update   
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to profile_path
      flash[:success] = "Successfully updated profile."
    else
      # print the errors to the development log
      Rails.logger.info(@user.errors.messages.inspect)
      render :action => 'edit'
    end
end
  
end
