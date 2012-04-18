class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end
  
  def new
    @property = Property.new
  end
  
  def create
    @property = Property.new(params[:property])
    if @property.save
      redirect_to properties_path
      flash[:success] = "Successfully added property"
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_url
    flash[:success] = "Successfully deleted property"
  end

end
