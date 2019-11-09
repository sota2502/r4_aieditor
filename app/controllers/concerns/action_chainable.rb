module ActionChainable
  extend ActiveSupport::Concern

  included do
    helper_method :action_chain
  end

  def action_chain
    @action_chain = ActionChain.find(params[:action_chain_id])
  end
end
