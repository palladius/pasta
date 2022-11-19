class PastaController < ApplicationController
  before_action :set_pastum, only: %i[ show edit update destroy ]

  # GET /pasta
  def index
    @pasta = Pastum.all
  end

  # GET /pasta/1
  def show
  end

  # GET /pasta/new
  def new
    @pastum = Pastum.new
  end

  # GET /pasta/1/edit
  def edit
  end

  # POST /pasta
  def create
    @pastum = Pastum.new(pastum_params)

    if @pastum.save
      redirect_to @pastum, notice: "Pastum was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pasta/1
  def update
    if @pastum.update(pastum_params)
      redirect_to @pastum, notice: "Pastum was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pasta/1
  def destroy
    @pastum.destroy
    redirect_to pasta_url, notice: "Pastum was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pastum
      @pastum = Pastum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pastum_params
      params.require(:pastum).permit(:name, :description, :active)
    end
end
