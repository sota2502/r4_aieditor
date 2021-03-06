class Motion
  DEFINITION = {
    1 => {name: "normal", caption: "通常　　"},
    2 => {name: "move", caption: "移動　　"},
    3 => {name: "move_dash", caption: "ダッシュ"},
    4 => {name: "move_slow", caption: "低速移動"},
    5 => {name: "move_back", caption: "後ずさり"},
    6 => {name: "turn", caption: "方向転換"},
    7 => {name: "jump_rise", caption: "Jump上昇"},
    8 => {name: "jump_fall", caption: "Jump下降"},
    9 => {name: "jump_land", caption: "Jump着地"},
    10 => {name: "guard", caption: "ガード　"},
    11 => {name: "air_guard", caption: "空ガード"},
    12 => {name: "roll", caption: "回避　　"},
    13 => {name: "air_roll", caption: "空中回避"},
    14 => {name: "damage", caption: "被弾　　"},
    15 => {name: "damage_knock", caption: "被弾・強"},
    16 => {name: "damage_rise", caption: "被弾上昇"},
    17 => {name: "damage_fall", caption: "被弾下降"},
    18 => {name: "damage_land", caption: "被弾着地"},
    19 => {name: "wake", caption: "起き上り"},
    20 => {name: "guardbreak", caption: "ガード破"},
    21 => {name: "attackbreak", caption: "弾かれ　"},
    22 => {name: "damage_stun", caption: "ピヨリ　"},
    23 => {name: "critical", caption: "被ｸﾘﾃｨｶﾙ"},
    24 => {name: "dead", caption: "死亡　　"},
    25 => {name: "attack", caption: "攻撃　　"},
    26 => {name: "attack2", caption: "攻撃２　"},
    27 => {name: "attack3", caption: "攻撃３　"},
    28 => {name: "attack4", caption: "攻撃４　"},
    29 => {name: "attack5", caption: "攻撃５　"},
    30 => {name: "attack_rise", caption: "打上攻撃"},
    31 => {name: "attack_fall", caption: "打下攻撃"},
    32 => {name: "air_attack", caption: "空中攻撃"},
    33 => {name: "air_attack2", caption: "空撃２　"},
    34 => {name: "air_attack3", caption: "空撃３　"},
    35 => {name: "air_attack4", caption: "空撃４　"},
    36 => {name: "air_attack5", caption: "空撃５　"},
    37 => {name: "airatk_rise", caption: "打上空撃"},
    38 => {name: "airatk_fall", caption: "打下空撃"},
    39 => {name: "magic", caption: "魔法　　"},
    40 => {name: "magic2", caption: "魔法２　"},
    41 => {name: "magic3", caption: "魔法３　"},
    42 => {name: "magic4", caption: "魔法４　"},
    43 => {name: "magic5", caption: "魔法５　"},
    44 => {name: "critical_atk", caption: "ｸﾘﾃｨｶﾙ撃"},
    45 => {name: "special", caption: "特殊動作"},
    46 => {name: "special2", caption: "特殊２　"},
    47 => {name: "special3", caption: "特殊３　"},
    48 => {name: "special4", caption: "特殊４　"},
    49 => {name: "special5", caption: "特殊５　"},
    50 => {name: "break", caption: "部位破壊　"},
    51 => {name: "break2", caption: "部位破壊２"},
    52 => {name: "break3", caption: "部位破壊３"},
    53 => {name: "break4", caption: "部位破壊４"},
    54 => {name: "break5", caption: "部位破壊５"},
    55 => {name: "extra_guard", caption: "拡張ガード　"},
    56 => {name: "extra_guard2", caption: "拡張ガード２"},
    57 => {name: "extra_guard3", caption: "拡張ガード３"},
    58 => {name: "extra_air_guard", caption: "拡張空ガード"},
    59 => {name: "extra_air_guard2", caption: "拡空ガード２"},
    60 => {name: "extra_air_guard3", caption: "拡空ガード３"},
    61 => {name: "extra_attack", caption: "拡張攻撃　　"},
    62 => {name: "extra_attack2", caption: "拡張攻撃２　"},
    63 => {name: "extra_attack3", caption: "拡張攻撃３　"},
    64 => {name: "extra_attack4", caption: "拡張攻撃４　"},
    65 => {name: "extra_attack5", caption: "拡張攻撃５　"},
    66 => {name: "extra_attack6", caption: "拡張攻撃６　"},
    67 => {name: "extra_attack7", caption: "拡張攻撃７　"},
    68 => {name: "extra_attack8", caption: "拡張攻撃８　"},
    69 => {name: "extra_attack9", caption: "拡張攻撃９　"},
    70 => {name: "extra_attack10", caption: "拡張攻撃10　"},
    71 => {name: "extra_attack11", caption: "拡張攻撃11　"},
    72 => {name: "extra_attack12", caption: "拡張攻撃12　"},
    73 => {name: "extra_attack13", caption: "拡張攻撃13　"},
    74 => {name: "extra_attack14", caption: "拡張攻撃14　"},
    75 => {name: "extra_attack15", caption: "拡張攻撃15　"},
    76 => {name: "extra_air_attack", caption: "拡張空中攻撃"},
    77 => {name: "extra_air_attack2", caption: "拡張空撃２　"},
    78 => {name: "extra_air_attack3", caption: "拡張空撃３　"},
    79 => {name: "extra_air_attack4", caption: "拡張空撃４　"},
    80 => {name: "extra_air_attack5", caption: "拡張空撃５　"},
    81 => {name: "extra_air_attack6", caption: "拡張空撃６　"},
    82 => {name: "extra_air_attack7", caption: "拡張空撃７　"},
    83 => {name: "extra_air_attack8", caption: "拡張空撃８　"},
    84 => {name: "extra_air_attack9", caption: "拡張空撃９　"},
    85 => {name: "extra_air_attack10", caption: "拡張空撃10　"},
    86 => {name: "extra_air_attack11", caption: "拡張空撃11　"},
    87 => {name: "extra_air_attack12", caption: "拡張空撃12　"},
    88 => {name: "extra_air_attack13", caption: "拡張空撃13　"},
    89 => {name: "extra_air_attack14", caption: "拡張空撃14　"},
    90 => {name: "extra_air_attack15", caption: "拡張空撃15　"},
    91 => {name: "extra_magic", caption: "拡張魔法　　"},
    92 => {name: "extra_magic2", caption: "拡張魔法２　"},
    93 => {name: "extra_magic3", caption: "拡張魔法３　"},
    94 => {name: "extra_magic4", caption: "拡張魔法４　"},
    95 => {name: "extra_magic5", caption: "拡張魔法５　"},
    96 => {name: "any_alive", caption: "生存時　"},
    97 => {name: "any_dead", caption: "死亡時　"},
    98 => {name: "any_move", caption: "移動時　"},
    99 => {name: "any_guard", caption: "ガード時"},
    100 => {name: "any_damage", caption: "被ダメ時"},
    101 => {name: "any_attack", caption: "攻撃時　"},
    102 => {name: "any_magic", caption: "魔法使用"},
    103 => {name: "any_special", caption: "特殊時　"},
    104 => {name: "any_break", caption: "部位破壊"},
    105 => {name: "any_extra_guard", caption: "拡張ガード時"},
    106 => {name: "any_extra_attack", caption: "拡張攻撃時　"},
    107 => {name: "any_extra_magic", caption: "拡張魔法使用"}
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

    def find_by_name(name)
      name = name.to_s if (name.is_a?(Symbol))
      id, attr = DEFINITION.find { |_, v| v[:name] == name }
      id.present? ? new(id) : nil
    end
  end
end
