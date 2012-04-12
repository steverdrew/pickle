class SessionsController < ApplicationController
  
  skip_before_filter :require_login, :except => [:destroy]
  
  def new
    @user = User.new
  end
  
  def index
  end
  
  def create
    respond_to do |format|
      if @user = login(params[:email],params[:password])
        format.html { redirect_back_or_to(:root) }
        flash[:success] = t('new.session.form.success_alert')
        format.xml { render :xml => @user, :status => :created, :location => @user }
     else
        format.html { flash.now[:error] = t('new.session.form.error_alert'); render :action => "new" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
    
  def destroy
    logout
    redirect_to(:root)
    flash[:success] = t('new.session.logout.alert_html')
 
  end
  
end
