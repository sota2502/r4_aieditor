class ActionRulesController < ApplicationController
  before_action :set_action_rule, only: [:show, :edit, :update, :destroy]
  before_action :set_action_group, only: [:show, :edit, :new]

  # GET /action_rules
  # GET /action_rules.json
  def index
    @action_rules = ActionRule.all
  end

  # GET /action_rules/1
  # GET /action_rules/1.json
  def show
  end

  # GET /action_rules/new
  def new
    @action_rule = ActionRule.new
  end

  # GET /action_rules/1/edit
  def edit
  end

  # POST /action_rules
  # POST /action_rules.json
  def create
    @action_rule = ActionRule.new(action_rule_params)

    respond_to do |format|
      if @action_rule.save
        format.html { redirect_to @action_rule, notice: 'Action rule was successfully created.' }
        format.json { render :show, status: :created, location: @action_rule }
      else
        format.html { render :new }
        format.json { render json: @action_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /action_rules/1
  # PATCH/PUT /action_rules/1.json
  def update
    respond_to do |format|
      if @action_rule.update(action_rule_params)
        format.html { redirect_to @action_rule, notice: 'Action rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @action_rule }
      else
        format.html { render :edit }
        format.json { render json: @action_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_rules/1
  # DELETE /action_rules/1.json
  def destroy
    @action_rule.destroy
    respond_to do |format|
      format.html { redirect_to action_rules_url, notice: 'Action rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action_rule
      @action_rule = ActionRule.find(params[:id])
    end

    def set_action_group
      @action_group = ActionGroup.find(params[:action_group_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def action_rule_params
      params.require(:action_rule).permit(:action_group_id, :name, :action_type_id, :next_act_timing_id, :holding_time, :velocity_x, :velocity_y)
    end
end
