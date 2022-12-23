class PastaSaucesController < ApplicationController
  before_action :set_pasta_sauce, only: %i[ show edit update destroy ]

  # GET /pasta_sauces
  def index
    @pasta_sauces ||= PastaSauce.all
  end

  # These are just two VIEW variants if index()...
  def index_boring
    @pasta_sauces ||= PastaSauce.all
  end
  def index_matrix
    @pasta_sauces_cached = slow_result_ps # PastaSauce.all
    @pastas = slow_result_pastas # Pasta.all #  @pasta_sauces_cached.map{|x| x.pasta}.uniq.sort
    @sauces = slow_result_sauces # Sauce.all #  @pasta_sauces_cached.map{|x| x.sauce}.uniq.sort
    # I have a feeling I can do better and already get ALL the pasta instead of getting shitloads of single ones.
    #pasta_slow_results
  end
  # def old_index_matrix
  #   @pasta_sauces_cached = PastaSauce.all
  #   @pastas =  @pasta_sauces_cached.map{|x| x.pasta}.uniq.sort
  #   @sauces =  @pasta_sauces_cached.map{|x| x.sauce}.uniq.sort
  #   # I have a feeling I can do better and already get ALL the pasta instead of getting shitloads of single ones.
  #   index
  # end


  # # https://sean-handley.medium.com/one-second-page-loads-with-rails-ffb1ba4aa19f
  # def pasta_slow_results
  #   Rails.cache.fetch("slow_api_results", expires_in: 10.minutes) do
  #   #  slow_api_call
  #     @pasta_sauces_cached = PastaSauce.all
  #     @pastas =  @pasta_sauces_cached.map{|x| x.pasta}.uniq.sort
  #     @sauces =  @pasta_sauces_cached.map{|x| x.sauce}.uniq.sort
  #   end
  # end
  def slow_result_ps
    Rails.cache.fetch("slow_all_pastasauces", expires_in: 10.minutes) do
      PastaSauce.all
    end
  end
  def slow_result_pastas
    Rails.cache.fetch("slow_all_pastas", expires_in: 10.minutes) do
      Pasta.all
    end
  end
  def slow_result_sauces
    Rails.cache.fetch("slow_all_sauces", expires_in: 10.minutes) do
      Sauce.all # @pasta_sauces_cached.map{|x| x.sauce}.uniq.sort
    end
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
