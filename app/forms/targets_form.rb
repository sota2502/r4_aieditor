class TargetsForm
  include ActiveModel::Model

  def initialize(targets_params = {})
    @targets_params = targets_params
  end  

  def save
    action_state_id = @targets_params[:action_state_id]
    targets = target_instances(action_state_id) + new_target_instances(action_state_id)
    Target.import targets, on_duplicate_key_update: [:value]
  end

  private

    def target_instances(action_state_id)
      @targets_params[:target][:targets].to_h.map do |_, param|
        Target.new(param.merge(action_state_id: action_state_id))
      end.select(&:valid?)
    end

    def new_target_instances(action_state_id)
      @targets_params[:target][:new_targets].to_a.map do |param|
        Target.new(param.merge(action_state_id: action_state_id))
      end.select(&:valid?)
    end
end
