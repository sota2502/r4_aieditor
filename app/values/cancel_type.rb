class CancelType
  DEFINITION = {
    1 => { name: :given_damage, caption: '被ダメージ', parameter1: :number, parameter2: :number },
    2 => { name: :taken_damage, caption: '与ダメージ', parameter1: :number, parameter2: :number },
    3 => { name: :time_elapsed, caption: '時間経過', parameter1: :number, parameter2: :number },
    4 => { name: :target_attack_action, caption: 'ターゲット攻撃行動', parameter1: :motions, parameter2: nil },
    5 => { name: :target_magick_action, caption: 'ターゲット魔法行動', parameter1: :motions, parameter2: nil },
    6 => { name: :target_jump, caption: 'ターゲットジャンプ', parameter1: nil, parameter2: nil  },
    6 => { name: :target_jump, caption: 'ターゲットジャンプ', parameter1: nil, parameter2: nil },
    7 => { name: :target_landing, caption: 'ターゲット着地', parameter1: nil, parameter2: nil },
    8 => { name: :target_guard, caption: 'ターゲットガード', parameter1: nil, parameter2: nil },
    9 => { name: :target_avoid, caption: 'ターゲット回避', parameter1: nil, parameter2: nil },
    10 => { name: :target_damage, caption: 'ターゲットダメージ', parameter1: nil, parameter2: nil },
    11 => { name: :target_guard_break, caption: 'ターゲットガードブレイク', parameter1: nil, parameter2: nil },
    12 => { name: :target_flip, caption: 'ターゲット弾かれ', parameter1: nil, parameter2: nil },
    13 => { name: :target_faint, caption: 'ターゲットピヨリ', parameter1: nil, parameter2: nil },
    14 => { name: :target_find, caption: 'ターゲット検知', parameter1: :target_types, parameter2: :searches },
    15 => { name: :target_not_find, caption: 'ターゲット非検知', parameter1: :target_types, parameter2: :searches },
    101 => { name: :own_hp, caption: '自分HP', parameter1: :number, parameter2: :number },
    102 => { name: :own_stamina, caption: '自分スタミナ', parameter1: :number, parameter2: :number },
    103 => { name: :own_robustness, caption: '自分頑強度', parameter1: :number, parameter2: :number },
    104 => { name: :own_balance, caption: '自分体幹', parameter1: :number, parameter2: :number },
    105 => { name: :own_stock, caption: '自分ストック', parameter1: :number, parameter2: :number }
  }

  attr_reader :id, :caption, :parameter1, :parameter2
  
  def initialize(id)
    @id = id
    @name = DEFINITION[id][:name]
    @caption = DEFINITION[id][:caption]
    @parameter1 = DEFINITION[id][:parameter1]
    @parameter2 = DEFINITION[id][:parameter2]
  end

  class << self
    def all
      DEFINITION.keys.sort.map { |id| new(id) }
    end
  end
end
