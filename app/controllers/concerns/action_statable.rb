module ActionStatable
  extend ActiveSupport::Concern

  included do
    helper_method :action_state
  end

  def action_state
    @action_state = ActionState.find(params[:action_state_id])
  end
end
