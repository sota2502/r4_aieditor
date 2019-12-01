class NextActTiming
  DEFINITION = {
    0 => { name: :motion_end, caption: 'モーション終了時'},
    1 => { name: :main_scene_end, caption: 'メインシーン終了時' },
    2 => { name: :end_scene_end, caption: 'エンドシーン終了時' },
    3 => { name: :holding_end, caption: 'ホールド時間経過時' },
    4 => { name: :find_target, caption: 'ターゲット認識時' },
    5 => { name: :handle_event, caption: 'イベント実行時' },
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
