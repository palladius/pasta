class PastasController < ApplicationController
  before_action :set_pasta, only: %i[ show edit update destroy ]

  # GET /pastas
  def index
    @pastas = Pasta.all
    #@pastas = Pasta.where(active: false)
  end

  # GET /pasta/1
  def show
  end

  # GET /pasta/new
  def new
    @pasta = Pasta.new
  end

  # GET /pasta/1/edit
  def edit
  end

  # POST /pasta
  def create
    @pasta = Pasta.new(pasta_params)

    if @pasta.save
      redirect_to @pasta, notice: "Pasta was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pasta/1
  def update
    if @pasta.update(pasta_params)
      redirect_to @pasta, notice: "Pasta was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pasta/1
  def destroy
    @pasta.destroy
    redirect_to pasta_url, notice: "Pasta was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pasta
      @pasta = Pasta.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pasta_params
      params.require(:pasta).permit(:name, :description, :active)
    end
end
