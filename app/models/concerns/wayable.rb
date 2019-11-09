module Wayable
  extend ActiveSupport::Concern

  def way
    Way.new(way_id)
  end

  def way=(obj)
    self.way_id = obj.id
  end
end
