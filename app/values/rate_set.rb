class RateSet
  attr_accessor :rate, :rate_coefficient

  def initialize(rate, rate_coefficient)
    @rate = rate
    @rate_coefficient = rate_coefficient
  end

  def for_lua
    if rate.nil? && rate_coefficient.nil?
      nil
    else
      [ rate&.name, rate_coefficient ]
    end
  end
end
