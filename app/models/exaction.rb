class Exaction < ApplicationRecord
  belongs_to :project
  has_many :hp_conditions
end
