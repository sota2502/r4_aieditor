class HpConditionsController < ApplicationController
  include Projectable
  include Exactionable

  before_action :set_hp_condition, only: [:show, :edit, :update, :destroy]

  # GET /hp_conditions
  # GET /hp_conditions.json
  def index
    @hp_conditions = HpCondition.all
  end

  # GET /hp_conditions/1
  # GET /hp_conditions/1.json
  def show
  end

  # GET /hp_conditions/new
  def new
    @hp_condition = HpCondition.new
  end

  # GET /hp_conditions/1/edit
  def edit
  end

  # POST /hp_conditions
  # POST /hp_conditions.json
  def create
    @hp_condition = HpCondition.new(hp_condition_params)

    respond_to do |format|
      if @hp_condition.save
        format.html { redirect_to [project, exaction, @hp_condition], notice: 'Hp condition was successfully created.' }
        format.json { render :show, status: :created, location: @hp_condition }
      else
        format.html { render :new }
        format.json { render json: @hp_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hp_conditions/1
  # PATCH/PUT /hp_conditions/1.json
  def update
    respond_to do |format|
      if @hp_condition.update(hp_condition_params)
        format.html { redirect_to [project, exaction, @hp_condition], notice: 'Hp condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @hp_condition }
      else
        format.html { render :edit }
        format.json { render json: @hp_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hp_conditions/1
  # DELETE /hp_conditions/1.json
  def destroy
    @hp_condition.destroy
    respond_to do |format|
      format.html { redirect_to [project, exaction], notice: 'Hp condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hp_condition
      @hp_condition = HpCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hp_condition_params
      params.require(:hp_condition).permit(:exaction_id, :value)
    end
end
