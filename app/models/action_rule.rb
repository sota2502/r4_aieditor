class ActionRule < ApplicationRecord
  include Motionable
  include NextActTimingable
  belongs_to :action_chain
  belongs_to :search, optional: true
  has_many :action_rule_cancels, dependent: :destroy
  has_many :cancel_conditions, through: :action_rule_cancels

  def target_type
    TargetType.new(target_value)
  end

  def for_lua
    {
      motion: motion&.name,
      move: move_for_lua,
      next: self.next,
      search: search&.name,
      target: target_value,
      hold: hold,
      way: way_id,
      cancel: cancel_conditions.map(&:for_lua)
    }
  end

  def add_cancel_condition(cancel_condition)
    action_rule_cancels.create!(cancel_condition: cancel_condition)
  end

  private

    def move_for_lua
      if move_x.present? && move_y.present?
        [move_x, move_y]
      else
        nil
      end
    end
end
