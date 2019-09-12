class HPCondition
  DEFINITION = {
    1 => { caption: '30%以下' },
    2 => { caption: '50%以下' },
    3 => { caption: '70%以下' }
  }

  attr_reader :caption
  
  def initialize(id)
    @id = id
    @caption = DEFINITION[id][:caption]
  end

  class << self
    def all
      DEFINITION.keys.sort.map { |id| new(id) }
    end
  end
end
