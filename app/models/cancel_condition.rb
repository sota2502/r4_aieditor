class CancelCondition < ApplicationRecord
  belongs_to :action_rule
  belongs_to :probability

  def cancel_type
    @cancel_type ||= begin
      CancelType.new(self.cancel_type_id)
    end
  end
end
