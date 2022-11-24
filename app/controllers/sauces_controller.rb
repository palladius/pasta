class SaucesController < ApplicationController
  before_action :set_sauce, only: %i[ show edit update destroy ]

  # GET /sauces
  def index
    @sauces = Sauce.all
  end

  # GET /sauces/1
  def show
    #@ingredients = @sauce.ingredients # Ingredient.where(:sauce => @sauce) #rescue nil
    @ingredient_sauces = IngredientSauce.where(:sauce_id => @sauce.id) # .map{|i_s| i_s.ingredient}
    #@ingredient_sauces = [@ingredient_sauces] unless @ingredient_sauces.is_a?(Array)
    @ingredients =  @ingredient_sauces.map{|i_s| i_s.ingredient}
#    @ingredients = @ingredient_sauces.is_a?(Array) ?
#      @ingredient_sauces.map{|i_s| i_s.ingredient} :
#      @ingredient_sauces.ingredient

  end

  # GET /sauces/new
  def new
    @sauce = Sauce.new
  end

  # GET /sauces/1/edit
  def edit
  end

  # POST /sauces
  def create
    @sauce = Sauce.new(sauce_params)

    if @sauce.save
      redirect_to @sauce, notice: "Sauce was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sauces/1
  def update
    if @sauce.update(sauce_params)
      redirect_to @sauce, notice: "Sauce was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /sauces/1
  def destroy
    @sauce.destroy
    redirect_to sauces_url, notice: "Sauce was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sauce
      @sauce = Sauce.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sauce_params
      params.require(:sauce).permit(:name, :description, :active)
    end
end
