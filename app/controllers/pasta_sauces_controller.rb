class PastaSaucesController < ApplicationController
  before_action :set_pasta_sauce, only: %i[ show edit update destroy ]

  # GET /pasta_sauces
  def index
    @pasta_sauces = PastaSauce.all
  end

  # These are just two VIEW variants if index()...
  def index_boring
    index
  end
  def index_matrix
    index
  end

  # GET /pasta_sauces/1
  def show
  end

  # GET /pasta_sauces/new
  def new
    @pasta_sauce = PastaSauce.new
  end

  # GET /pasta_sauces/1/edit
  def edit
  end

  # POST /pasta_sauces
  def create
    @pasta_sauce = PastaSauce.new(pasta_sauce_params)

    if @pasta_sauce.save
      redirect_to @pasta_sauce, notice: "Pasta sauce was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pasta_sauces/1
  def update
    if @pasta_sauce.update(pasta_sauce_params)
      redirect_to @pasta_sauce, notice: "Pasta sauce was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pasta_sauces/1
  def destroy
    @pasta_sauce.destroy
    redirect_to pasta_sauces_url, notice: "Pasta sauce was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pasta_sauce
      @pasta_sauce = PastaSauce.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pasta_sauce_params
      params.require(:pasta_sauce).permit(:appropriate, :vote, :notes, :pasta_id, :sauce_id)
    end
end
