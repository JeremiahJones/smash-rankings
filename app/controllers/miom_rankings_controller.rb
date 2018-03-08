class MiomRankingsController < ApplicationController
  before_action :set_miom_ranking, only: [:show, :edit, :update, :destroy]

  # GET /miom_rankings
  # GET /miom_rankings.json
  def index
    @miom_rankings = MiomRanking.all
  end

  # GET /miom_rankings/1
  # GET /miom_rankings/1.json
  def show
  end

  # GET /miom_rankings/new
  def new
    @miom_ranking = MiomRanking.new
  end

  # GET /miom_rankings/1/edit
  def edit
  end

  # POST /miom_rankings
  # POST /miom_rankings.json
  def create
    @miom_ranking = MiomRanking.new(miom_ranking_params)

    respond_to do |format|
      if @miom_ranking.save
        format.html { redirect_to @miom_ranking, notice: 'Miom ranking was successfully created.' }
        format.json { render :show, status: :created, location: @miom_ranking }
      else
        format.html { render :new }
        format.json { render json: @miom_ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /miom_rankings/1
  # PATCH/PUT /miom_rankings/1.json
  def update
    respond_to do |format|
      if @miom_ranking.update(miom_ranking_params)
        format.html { redirect_to @miom_ranking, notice: 'Miom ranking was successfully updated.' }
        format.json { render :show, status: :ok, location: @miom_ranking }
      else
        format.html { render :edit }
        format.json { render json: @miom_ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /miom_rankings/1
  # DELETE /miom_rankings/1.json
  def destroy
    @miom_ranking.destroy
    respond_to do |format|
      format.html { redirect_to miom_rankings_url, notice: 'Miom ranking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_miom_ranking
      @miom_ranking = MiomRanking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def miom_ranking_params
      params.fetch(:miom_ranking, {})
    end
end
