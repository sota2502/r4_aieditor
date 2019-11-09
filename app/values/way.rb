class Way
  DEFINITION = {
    0 => { caption: '方向指定なし／正面方向' },
    1 => { caption: '移動方向／現在方向基準' },
    2 => { caption: '右方向' },
    3 => { caption: 'ターゲット方向' },
    4 => { caption: '方向反転／背面方向' },
    5 => { caption: '移動逆方向／逆方向基準' },
    6 => { caption: '左方向' },
    7 => { caption: 'ターゲット逆方向／追従' }
  }

  attr_reader :id, :caption
  
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
