class Exaction < ApplicationRecord
  belongs_to :project
  has_many :hp_conditions

  def for_lua
    {
      name: name,
      condition: hp_conditions.map(&:value),
      action: hp_conditions.map(&:for_lua)
    }
  end
end
