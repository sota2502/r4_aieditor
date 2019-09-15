class TargetMotion
  DEFINITION = {
    1 => { name: :all_attack, caption: '攻撃全般' },
    2 => { name: :all_damage_motion, caption: 'ダメージモーション全般' }
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
