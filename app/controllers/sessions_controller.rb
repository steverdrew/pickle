class SessionsController < ApplicationController
   def new
    @user = User.new
  end
  
  def create
    if @user = login(params[:email],params[:password])
      respond_to do |wants|  
        wants.html { redirect_to user_path(@user_session.user) }  
        wants.js { render :action => :redirect } # JavaScript to do the redirect  
      end  
    else  
      respond_to do |wants|  
        wants.html { render :new }  
        wants.js # defaults to create.js.erb  
      end  
    end  
    
  def destroy
    logout
    redirect_to(:users, :notice => 'Logged out!')
  end
  
end
  end