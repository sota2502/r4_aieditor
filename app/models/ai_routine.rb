class AiRoutine < ApplicationRecord
  has_many :target_action_conditions

  def render
    self.attributes.slice(*%w(id name))
  end
end
