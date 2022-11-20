class SaucesController < ApplicationController

  hobo_model_controller

  auto_actions :all
  
  def show
    hobo_show do |format|
      format.xml do
        @sauce = Sauce.find( params[:id])
        render :xml => @sauce
      end
      format.html do
        # leave this to Hobo
      end
    end
  end
  
  def index
    hobo_index do |format|
      format.xml do
        @sauces = Sauce.find( :all )
        render :xml => @sauces
      end
      format.html do
        # leave this to Hobo
      end
    end
  end
  

end
