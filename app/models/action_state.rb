class ActionState < ApplicationRecord
  belongs_to :project
  has_many :searches
  has_many :rates
  has_many :targets

  def for_lua
    {
      chara: chara,
      field: field,
      searches: searches.map(&:for_lua).to_h,
      rates: rates.map(&:for_lua).to_h,
      freq: freq,
      precis: precis,
      targets: targets.map(&:value)
    }
  end
end
