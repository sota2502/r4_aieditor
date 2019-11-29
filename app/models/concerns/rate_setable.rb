module RateSetable
  extend ActiveSupport::Concern

  def rate_set
    @rate_set ||= RateSet.new(rate, rate_coefficient)
  end

  def rate_set=(args)
    raise 'Args is not RateSet' unless args.is_a?(RateSet)
    @rate_set = args
    self.rate = args.rate
    self.rate_coefficient = args.rate_coefficient
  end

  def rate_for_lua
    rate_set.for_lua
  end

  def rate_id=(args)
    super(args)
    rate_set.rate = self.rate
  end

  def rate=(args)
    super(args)
    rate_set.rate = args
  end

  def rate_coefficient=(args)
    super(args)
    rate_set.rate_coefficient = args
  end
end
