class CancelCondition < ApplicationRecord
  include CancelTypable
  belongs_to :project
  belongs_to :rate, optional: true

  def for_lua
    [
      cancel_type_id,
      rate_for_lua,
      parameter1_for_lua,
      parameter2_for_lua
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

    def parameter1_for_lua
      parameter_lua_value(parameter1, cancel_type.parameter1)
    end

    def parameter2_for_lua
      parameter_lua_value(parameter2, cancel_type.parameter2)
    end

    def parameter_lua_value(value, type)
      return nil if value.nil?
      case type
      when :number then
        value
      when :motions then
        Motion.new(value).name
      when :target_types then
        value
      when :searched then
        Search.find(value).name
      else
        nil
      end
    end
end
