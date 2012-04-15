class UsersController < ApplicationController
  
  before_filter :require_no_user, :only => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def edit
    require_login
    @user = current_user
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

  def update
    @user = User.find(current_user)
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'Your details were successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @user = User.find(current_user)
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end
end
