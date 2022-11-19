class SaucesController < ApplicationController
  before_action :set_sauce, only: %i[ show edit update destroy ]

  # GET /sauces
  def index
    @sauces = Sauce.all
  end

  # GET /sauces/1
  def show
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
