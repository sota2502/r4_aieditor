class CancelType
  DEFINITION = {
    1 => { name: :given_damage, caption: '被ダメージ' },
    2 => { name: :taken_damage, caption: '与ダメージ' },
    3 => { name: :time_elapsed, caption: '時間経過' },
    4 => { name: :target_attack_action, caption: 'ターゲット攻撃行動' },
    5 => { name: :target_magick_action, caption: 'ターゲット魔法行動' },
    6 => { name: :target_jump, caption: 'ターゲットジャンプ' },
    6 => { name: :target_jump, caption: 'ターゲットジャンプ' },
    7 => { name: :target_landing, caption: 'ターゲット着地' },
    8 => { name: :target_guard, caption: 'ターゲットガード' },
    9 => { name: :target_avoid, caption: 'ターゲット回避' },
    10 => { name: :target_damage, caption: 'ターゲットダメージ' },
    11 => { name: :target_guard_break, caption: 'ターゲットガードブレイク' },
    12 => { name: :target_flip, caption: 'ターゲット弾かれ' },
    13 => { name: :target_faint, caption: 'ターゲットピヨリ' }
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
