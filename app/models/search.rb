class Search < ApplicationRecord
  belongs_to :action_state

  def for_lua
    [ name, attributes.values_at(*%w(x1 y1 x2 y2))]
  end
end
