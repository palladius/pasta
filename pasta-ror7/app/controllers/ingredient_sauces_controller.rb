class IngredientSaucesController < ApplicationController
  before_action :set_ingredient_sauce, only: %i[ show edit update destroy ]

  # GET /ingredient_sauces
  def index
    @ingredient_sauces = IngredientSauce.all
  end

  # GET /ingredient_sauces/1
  def show
  end

  # GET /ingredient_sauces/new
  def new
    @ingredient_sauce = IngredientSauce.new
  end

  # GET /ingredient_sauces/1/edit
  def edit
  end

  # POST /ingredient_sauces
  def create
    @ingredient_sauce = IngredientSauce.new(ingredient_sauce_params)

    if @ingredient_sauce.save
      redirect_to @ingredient_sauce, notice: "Ingredient sauce was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ingredient_sauces/1
  def update
    if @ingredient_sauce.update(ingredient_sauce_params)
      redirect_to @ingredient_sauce, notice: "Ingredient sauce was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /ingredient_sauces/1
  def destroy
    @ingredient_sauce.destroy
    redirect_to ingredient_sauces_url, notice: "Ingredient sauce was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient_sauce
      @ingredient_sauce = IngredientSauce.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ingredient_sauce_params
      params.require(:ingredient_sauce).permit(:necessary, :sauce_id, :ingredient_id, :notes)
    end
end
