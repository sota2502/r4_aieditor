class ActionRule < ApplicationRecord
  include Motionable
  include NextActTimingable
  belongs_to :action_chain
  belongs_to :search
  has_many :action_rule_cancels
  has_many :cancel_conditions, through: :action_rule_cancels

  validates :motion_id, presence: true, inclusion: { in: Motion::DEFINITION.keys }
  validates :next, presence: true, inclusion: { in: NextActTiming::DEFINITION.keys }
  validates :target_value, presence: true, inclusion: { in: TargetType::DEFINITION.keys }

  def target_type
    TargetType.new(target_value)
  end

  def for_lua
    {
      motion: motion.caption,
      move: move_for_lua,
      next: self.next,
      search: search.name,
      target: target_value,
      hold: hold,
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
