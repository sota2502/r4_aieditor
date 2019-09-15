class HpCondition
  DEFINITION = {
    1 => { name: 'under30%', caption: '30%以下' },
    2 => { name: 'under50%', caption: '50%以下' },
    3 => { name: 'under70%', caption: '70%以下' }
  }

  attr_reader :id, :name, :caption
  
  def initialize(id)
    @id = id
    @name = DEFINITION[id][:name]
    @caption = DEFINITION[id][:caption]
  end

  class << self
    def all
      DEFINITION.keys.sort.map { |id| new(id) }
    end
  end
end
