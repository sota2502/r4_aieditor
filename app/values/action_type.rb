class ActionType
  DEFINITION = {
    1 => { name: :wait, caption: '待機' },
    2 => { name: :move, caption: '移動' },
    3 => { name: :motion, caption: 'モーション' }
  }

  attr_reader :id, :caption
  
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
