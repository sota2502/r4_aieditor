class TargetActionConditionsController < ApplicationController
  before_action :set_target_action_condition, only: [:show, :edit, :update, :destroy]
  before_action :set_ai_routine_and_hp_condition

  # GET /target_action_conditions
  # GET /target_action_conditions.json
  def index
    @target_action_conditions = TargetActionCondition.all
  end

  # GET /target_action_conditions/1
  # GET /target_action_conditions/1.json
  def show
  end

  # GET /target_action_conditions/new
  def new
    @target_action_condition = TargetActionCondition.new
  end

  # GET /target_action_conditions/1/edit
  def edit
  end

  # POST /target_action_conditions
  # POST /target_action_conditions.json
  def create
    @target_action_condition = TargetActionCondition.new(target_action_condition_params)

    respond_to do |format|
      if @target_action_condition.save
        format.html { redirect_to action: :index }
        format.json { render :show, status: :created, location: @target_action_condition }
      else
        format.html { render :new }
        format.json { render json: @target_action_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /target_action_conditions/1
  # PATCH/PUT /target_action_conditions/1.json
  def update
    respond_to do |format|
      if @target_action_condition.update(target_action_condition_params)
        format.html { redirect_to action: :index }
        format.json { render :show, status: :ok, location: @target_action_condition }
      else
        format.html { render :edit }
        format.json { render json: @target_action_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /target_action_conditions/1
  # DELETE /target_action_conditions/1.json
  def destroy
    @target_action_condition.destroy
    respond_to do |format|
      format.html { redirect_to target_action_conditions_url, notice: 'Targe action condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_target_action_condition
      @target_action_condition = TargetActionCondition.find(params[:id])
    end

    def set_ai_routine_and_hp_condition
      @ai_routine = AiRoutine.find(params[:ai_routine_id])
      @hp_condition = HpCondition.new(params[:hp_condition_id].to_i)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def target_action_condition_params
      params.require(:target_action_condition).permit(:hp_condition_id, :search_range_id, :target_type_id, :target_motion_id, :probability_id, :probability_coefficient, :previous_cancel_type, :action_group_id)
    end
end
