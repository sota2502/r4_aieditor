class Rate < ApplicationRecord
  belongs_to :action_state

  def for_lua
    [ name, value ]
  end
end
