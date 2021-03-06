class TargetType
  DEFINITION = {
    -2 => { name: :current_target, caption: '現在のターゲット' },
    -1 => { name: :no_target, caption: '認識なし' },
    0 => { name: :any, caption: '任意' },
    1 => { name: :player, caption: 'プレイヤー' },
    2 => { name: :self, caption: '自分' },
    3 => { name: :buddy, caption: '味方' },
    4 => { name: :enemy, caption: '敵' },
    5 => { name: :buddy_object, caption: '味方オブジェクト' },
    6 => { name: :enemy_object, caption: '敵オブジェクト' }
  }

  ORDER = [-2, -1, 0, 1, 2, 3, 4, 5, 6]

  attr_reader :id, :name, :caption
  
  def initialize(id)
    @id = id
    @name = DEFINITION[id][:name]
    @caption = DEFINITION[id][:caption]
  end

  class << self
    def all
      ORDER.map { |id| new(id) }
    end

    def valid?(id)
      DEFINITION.include?(id)
    end
  end
end
