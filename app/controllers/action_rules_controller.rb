class ActionRulesController < ApplicationController
  include Projectable
  include ActionChainable

  before_action :set_action_rule, only: [:show, :edit, :update, :destroy]

  # GET /action_rules
  # GET /action_rules.json
  def index
    @action_rule = ActionRule.new
    @action_rules = action_chain.action_rules
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
    ActionRulesForm.new(action_rule_params).save

    respond_to do |format|
      format.html { redirect_to [project, action_chain], notice: 'Action rule was successfully created.' }
      format.json { render :show, status: :created, location: @action_rule }
    end
  end

  # PATCH/PUT /action_rules/1
  # PATCH/PUT /action_rules/1.json
  def update
    respond_to do |format|
      if @action_rule.update(action_rule_params)
        format.html { redirect_to [project, action_chain], notice: 'Action rule was successfully updated.' }
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
      format.html { redirect_to [project, action_chain], notice: 'Action rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action_rule
      @action_rule = ActionRule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def action_rule_params
      params.permit(:project_id,
                    :action_chain_id,
                    action_rule: {
                      action_rules: [:id, :motion_id, :move_x, :move_y, :next, :search_id, :target_value, :hold],
                      new_action_rules: [:motion_id, :move_x, :move_y, :next, :search_id, :target_value, :hold]
                    })
    end
end
