class CancelConditionsForm
  include ActiveModel::Model

  ATTRIBUTES = %i(cancel_type_id rate_id rate_coefficient parameter1 parameter2)

  def initialize(parent, cancel_conditions_params = {})
    @parent = parent
    @cancel_conditions_params = cancel_conditions_params
  end  

  def save
    ApplicationRecord.transaction do
      update_cancel_condition
      create_cancel_condition
    end
  end

  private

    def update_cancel_condition
      cancel_conditions = @cancel_conditions_params[:cancel_conditions].to_h.map do |_, param|
        CancelCondition.new(param)
      end
      CancelCondition.import cancel_conditions, on_duplicate_key_update: ATTRIBUTES
    end

    def create_cancel_condition
      @cancel_conditions_params[:new_cancel_conditions].to_a.map do |param|
        cancel_condition = CancelCondition.create!(param)
        @parent.add_cancel_condition(cancel_condition)
      end
    end
end
