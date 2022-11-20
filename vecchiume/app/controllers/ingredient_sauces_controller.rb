class IngredientSaucesController < ApplicationController
  def index
    @ingredient_sauces = IngredientSauce.all
  end
  
  def show
    @ingredient_sauce = IngredientSauce.find(params[:id])
  end
  
  def new
    @ingredient_sauce = IngredientSauce.new
  end
  
  def create
    @ingredient_sauce = IngredientSauce.new(params[:ingredient_sauce])
    if @ingredient_sauce.save
      flash[:notice] = "Successfully created ingredient sauce."
      redirect_to @ingredient_sauce
    else
      render :action => 'new'
    end
  end
  
  def edit
    @ingredient_sauce = IngredientSauce.find(params[:id])
  end
  
  def update
    @ingredient_sauce = IngredientSauce.find(params[:id])
    if @ingredient_sauce.update_attributes(params[:ingredient_sauce])
      flash[:notice] = "Successfully updated ingredient sauce."
      redirect_to @ingredient_sauce
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @ingredient_sauce = IngredientSauce.find(params[:id])
    @ingredient_sauce.destroy
    flash[:notice] = "Successfully destroyed ingredient sauce."
    redirect_to ingredient_sauces_url
  end
end
