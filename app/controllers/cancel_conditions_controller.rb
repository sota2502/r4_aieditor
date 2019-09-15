class CancelConditionsController < ApplicationController
  before_action :set_cancel_condition, only: [:show, :edit, :update, :destroy]
  before_action :set_action_rule

  # GET /cancel_conditions
  # GET /cancel_conditions.json
  def index
    @cancel_conditions = CancelCondition.all
  end

  # GET /cancel_conditions/1
  # GET /cancel_conditions/1.json
  def show
  end

  # GET /cancel_conditions/new
  def new
    @cancel_condition = CancelCondition.new
  end

  # GET /cancel_conditions/1/edit
  def edit
  end

  # POST /cancel_conditions
  # POST /cancel_conditions.json
  def create
    @cancel_condition = CancelCondition.new(cancel_condition_params)

    respond_to do |format|
      if @cancel_condition.save
        format.html { redirect_to action: :index, notice: 'Cancel condition was successfully created.' }
        format.json { render :show, status: :created, location: @cancel_condition }
      else
        format.html { render :new }
        format.json { render json: @cancel_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cancel_conditions/1
  # PATCH/PUT /cancel_conditions/1.json
  def update
    respond_to do |format|
      if @cancel_condition.update(cancel_condition_params)
        format.html { redirect_to action: :index, notice: 'Cancel condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @cancel_condition }
      else
        format.html { render :edit }
        format.json { render json: @cancel_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cancel_conditions/1
  # DELETE /cancel_conditions/1.json
  def destroy
    @cancel_condition.destroy
    respond_to do |format|
      format.html { redirect_to cancel_conditions_url, notice: 'Cancel condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cancel_condition
      @cancel_condition = CancelCondition.find(params[:id])
    end

    def set_action_rule
      @action_rule = ActionRule.find(params[:action_rule_id])
      @action_group = @action_rule.action_group
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cancel_condition_params
      params.require(:cancel_condition).permit(:action_rule_id, :cancel_type_id, :probability_id, :probability_coefficient, :parameter1, :parameter2)
    end
end
