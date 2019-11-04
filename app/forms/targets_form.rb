class TargetsForm
  include ActiveModel::Model

  def initialize(targets_params = {})
    @targets_params = targets_params
  end  

  def save
    action_state_id = @targets_params[:action_state_id]
    params = @targets_params[:target][:targets]
    indeces = params.keys.sort_by(&:to_i)
    targets = indeces.map do |i|
      Target.new(params[i].merge(action_state_id: action_state_id))
    end
    Target.import targets, on_duplicate_key_update: [:value]
  end
end
