class PastasController < ApplicationController

  hobo_model_controller

  auto_actions :all
  
  def show
       hobo_show do |format|
         format.xml do
           @pasta = Pasta.find( params[:id] )
           render :xml => @pasta
         end
         format.html do
           # leave this to Hobo
         end
       end
  end
  
  
  def index
    hobo_index do |format|
      format.xml do
        @pastas = Pasta.find( :all )
        render :xml => @pastas
      end
      format.html do
        # leave this to Hobo
      end
    end
  end

end
