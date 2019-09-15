class TargetType
  DEFINITION = {
    1 => { name: :player, caption: 'プレイヤー' },
    2 => { name: :buddy, caption: '味方' },
    3 => { name: :enemy, caption: '敵' },
    4 => { name: :buddy_object, caption: '味方オブジェクト' },
    5 => { name: :enemy_object, caption: '敵オブジェクト' }
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
