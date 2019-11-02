class ActionRuleCancelConditionsController < ApplicationController
  include Projectable
  include ActionChainable

  before_action :set_action_rule
  before_action :set_cancel_condition, only: [:edit, :update, :destroy]

  def index
    @cancel_conditions = @action_rule.cancel_conditions
  end

  def create
    create_cancel_condition
    redirect_to action: :index
  end

  def update
    update_params = cancel_condition_params.slice(:cancel_type_id, :rate_id, :rate_coefficient,
                                                  :parameter1, :parameter2)
    @cancel_condition.update(update_params)
    redirect_to action: :index
  end

  def destroy
    destroy_cancel_condition
    redirect_to action: :index
  end

  private
    def set_action_rule
      @action_rule = ActionRule.find(params[:action_rule_id])
    end

    def set_cancel_condition
      @cancel_condition = CancelCondition.find(params[:id])
    end

    def cancel_condition_params
      params.permit(:project_id, :action_chain_id, :cancel_type_id, :rate_id, :rate_coefficient, :parameter1, :parameter2)
    end

    def create_cancel_condition
      ApplicationRecord.transaction do
        cancel_condition = CancelCondition.create!(
          cancel_condition_params.slice(:project_id, :cancel_type_id, :rate_id, :rate_coefficient, :parameter1, :parameter2)
        )
        ac = ActionRuleCancel.create!(
          action_rule_id: @action_rule.id,
          cancel_condition_id: cancel_condition.id
        )
      end
    end
  
    def destroy_cancel_condition
      ApplicationRecord.transaction do
        ActionRuleCancel.find_by(
          action_rule_id: @action_rule.id,
          cancel_condition_id: @cancel_condition.id
        ).destroy
        @cancel_condition.destroy
      end
    end
end
