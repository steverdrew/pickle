class OauthsController < ApplicationController
  skip_before_filter :require_login

  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
    else
      #begin
        logger.info("1111")
        @user = create_from(provider)
        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule
        logger.info("2222")
        reset_session # protect from session fixation attack
        logger.info("33333")
        auto_login(@user)
        logger.info("4444")
        
        redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
      #rescue
      #  redirect_to root_path, :alert => "Failed to register from #{provider.titleize}!"
      #end
    end
  end
end