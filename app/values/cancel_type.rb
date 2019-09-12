class CancelType
  DEFINITION = {
    1 => { name: :given_damage, caption: '被ダメージ' },
    2 => { name: :taken_damage, caption: '与ダメージ' },
    3 => { name: :freeze_time, caption: '時間経過' },
    4 => { name: :target_action, caption: 'ターゲット攻撃行動' },
    5 => { name: :target_motion, caption: 'ターゲットモーション時' }
  }

  attr_reader :caption
  
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
