class ActionRulesForm
  include ActiveModel::Model

  ATTRIBUTES = %i(motion_id move_x move_y next search_id target_value hold)

  def initialize(action_rules_params = {})
    @action_rules_params = action_rules_params
  end  

  def save
    action_chain_id = @action_rules_params[:action_chain_id]
    action_rules = action_rule_instances(action_chain_id) + new_action_rule_instances(action_chain_id)
    ActionRule.import action_rules, on_duplicate_key_update: ATTRIBUTES
  end

  private

    def action_rule_instances(action_chain_id)
      @action_rules_params[:action_rule][:action_rules].to_h.map do |_, param|
        ActionRule.new(param.merge(action_chain_id: action_chain_id))
      end.select(&:valid?)
    end

    def new_action_rule_instances(action_chain_id)
      @action_rules_params[:action_rule][:new_action_rules].to_a.map do |param|
        ActionRule.new(param.merge(action_chain_id: action_chain_id))
      end.select(&:valid?)
    end
end
