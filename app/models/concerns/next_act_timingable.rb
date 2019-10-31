module NextActTimingable
  extend ActiveSupport::Concern

  def next_act_timing
    NextActTiming.new(self.next)
  end

  def next_act_timing=(obj)
    self.next = obj.id
  end
end
