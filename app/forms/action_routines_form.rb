class ActionRoutinesForm
  include ActiveModel::Model

  ATTRIBUTES = %i(search_id target_value motion_id rate_id rate_coefficient cancel_type_id action_chain_id)

  def initialize(action_routines_params = {})
    @action_routines_params = action_routines_params
  end  

  def save
    hp_condition_id = @action_routines_params[:hp_condition_id]
    action_routines = action_routine_instances(hp_condition_id) + new_action_routine_instances(hp_condition_id)
    ActionRoutine.import action_routines, on_duplicate_key_update: ATTRIBUTES
  end

  private

    def action_routine_instances(hp_condition_id)
      @action_routines_params[:action_routine][:action_routines].to_h.map do |_, param|
        ActionRoutine.new(param.merge(hp_condition_id: hp_condition_id))
      end.select(&:valid?)
    end

    def new_action_routine_instances(hp_condition_id)
      @action_routines_params[:action_routine][:new_action_routines].to_a.map do |param|
        ActionRoutine.new(param.merge(hp_condition_id: hp_condition_id))
      end.select(&:valid?)
    end
end
