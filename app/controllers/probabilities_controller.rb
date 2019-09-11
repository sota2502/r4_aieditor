class ProbabilitiesController < ApplicationController
  before_action :set_probability, only: [:show, :edit, :update, :destroy]

  # GET /probabilities
  # GET /probabilities.json
  def index
    @probabilities = Probability.all
  end

  # GET /probabilities/1
  # GET /probabilities/1.json
  def show
  end

  # GET /probabilities/new
  def new
    @probability = Probability.new
  end

  # GET /probabilities/1/edit
  def edit
  end

  # POST /probabilities
  # POST /probabilities.json
  def create
    @probability = Probability.new(probability_params)

    respond_to do |format|
      if @probability.save
        format.html { redirect_to action: :index }
        format.json { render :show, status: :created, location: @probability }
      else
        format.html { render :new }
        format.json { render json: @probability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /probabilities/1
  # PATCH/PUT /probabilities/1.json
  def update
    respond_to do |format|
      if @probability.update(probability_params)
        format.html { redirect_to action: :index }
        format.json { render :show, status: :ok, location: @probability }
      else
        format.html { render :edit }
        format.json { render json: @probability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /probabilities/1
  # DELETE /probabilities/1.json
  def destroy
    @probability.destroy
    respond_to do |format|
      format.html { redirect_to probabilities_url, notice: 'Probability was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_probability
      @probability = Probability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def probability_params
      params.fetch(:probability, {}).permit(:name, :default_value, :correction_value)
    end
end
