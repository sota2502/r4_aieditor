class CancelCondition < ApplicationRecord
  include CancelTypable
  belongs_to :project
  belongs_to :rate, optional: true

  def for_lua
    [
      cancel_type_id,
      rate_for_lua,
      parameter1,
      parameter2
    ]
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
