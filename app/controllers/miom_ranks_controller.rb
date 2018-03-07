class MiomRanksController < ApplicationController
  before_action :set_miom_rank, only: [:show, :edit, :update, :destroy]

  # GET /miom_ranks
  # GET /miom_ranks.json
  def index
    @miom_ranks = MiomRank.all
  end

  # GET /miom_ranks/1
  # GET /miom_ranks/1.json
  def show
  end

  # GET /miom_ranks/new
  def new
    @miom_rank = MiomRank.new
  end

  # GET /miom_ranks/1/edit
  def edit
  end

  # POST /miom_ranks
  # POST /miom_ranks.json
  def create
    @miom_rank = MiomRank.new(miom_rank_params)

    respond_to do |format|
      if @miom_rank.save
        format.html { redirect_to @miom_rank, notice: 'Miom rank was successfully created.' }
        format.json { render :show, status: :created, location: @miom_rank }
      else
        format.html { render :new }
        format.json { render json: @miom_rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /miom_ranks/1
  # PATCH/PUT /miom_ranks/1.json
  def update
    respond_to do |format|
      if @miom_rank.update(miom_rank_params)
        format.html { redirect_to @miom_rank, notice: 'Miom rank was successfully updated.' }
        format.json { render :show, status: :ok, location: @miom_rank }
      else
        format.html { render :edit }
        format.json { render json: @miom_rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /miom_ranks/1
  # DELETE /miom_ranks/1.json
  def destroy
    @miom_rank.destroy
    respond_to do |format|
      format.html { redirect_to miom_ranks_url, notice: 'Miom rank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_miom_rank
      @miom_rank = MiomRank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def miom_rank_params
      params.require(:miom_rank).permit(:year, :score, :change, :rank)
    end
end
