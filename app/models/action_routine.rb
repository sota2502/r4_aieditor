class ActionRoutine < ApplicationRecord
  include Motionable
  include CancelTypable
  belongs_to :hp_condition
  belongs_to :search, optional: true
  belongs_to :rate, optional: true
  belongs_to :action_chain

  def target_type
    TargetType.new(target_value)
  end

  def for_lua
    {
      search: search.name,
      target: target_value,
      motion: motion.name,
      rate: rate_for_lua,
      cancel: cancel_type_id,
      action: action_chain.name
    }
  end

  private

    def rate_for_lua
      if rate.nil?
        if rate_coefficient.nil?
          nil
        else
          [rate_coefficient]
        end
      else
        [rate.name, rate_coefficient].select(&:present?)
      end
    end
end
