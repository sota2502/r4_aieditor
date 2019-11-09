class RatesController < ApplicationController
  include Projectable
  include ActionStatable
  
  before_action :set_rate, only: [:update, :destroy]

  # GET /rates
  # GET /rates.json
  def index
    @rates = action_state.rates
    @rate = Rate.new
  end

  # POST /rates
  # POST /rates.json
  def create
    RatesForm.new(rate_params).save

    respond_to do |format|
      format.html { redirect_to project_action_state_rates_path(project, action_state) }
      format.json { render :show, status: :created, location: @rate }
    end
  end

  # PATCH/PUT /rates/1
  # PATCH/PUT /rates/1.json
  def update
    respond_to do |format|
      if @rate.update(rate_params)
        format.html { redirect_to project_action_state_rates_path(project, action_state) }
        format.json { render :show, status: :ok, location: @rate }
      end
    end
  end

  # DELETE /rates/1
  # DELETE /rates/1.json
  def destroy
    @rate.destroy
    respond_to do |format|
      format.html { redirect_to project_action_state_rates_path(project, action_state) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rate
      @rate = Rate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rate_params
      params.permit(:project_id,
                    :action_state_id,
                    rate: {
                      rates: [:id, :name, :value],
                      new_rates: [:name, :value],
                    })
    end
end
