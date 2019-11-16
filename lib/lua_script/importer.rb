require 'rlua'

module LuaScript
  class Importer
    attr_reader :project, :lua_string

    def initialize(project, lua_string)
      @project = project
      @lua_string = lua_string
    end

    def import
      table = lua_table
      ApplicationRecord.transaction do
        import_action_state(table['actionstate'])
        table['actionchains'].each do |action_chain|
          import_action_chain(action_chain)
        end
        import_exaction(table['exaction'])
      end
    end

    private

      def lua_table
        root_path = Rails.root.to_s
        code = <<~"EOT"
          dofile("#{root_path}/lua/func.lua")
          #{@lua_string}
        EOT

        state = Lua::State.new
        state.__load_stdlib :all
        state.__eval code
        return recursive_convert(state.stash)
      end

      def recursive_convert(ltable)
        return ltable unless ltable.is_a?(Lua::Table)

        hash = ltable.to_hash
        if hash.keys.all? { |e| e.is_a?(Numeric) }
          ltable.to_a.map { |v| recursive_convert(v) }
        else
          hash.deep_transform_values { |v| recursive_convert(v) }
        end
      end

      def import_action_state(table)
        action_state = ActionState.includes(:searches, :rates, :targets)
                                  .find_or_initialize_by(project: @project)
        action_state.attributes = table.slice('chara', 'field', 'freq', 'precis')
        action_state.save!

        searches = table['searches'].map do |name, pos|
          arr = pos.map(&:to_i)
          search = action_state.searches.find_or_initialize_by(name: name)
          search.attributes = %i(x1 y1 x2 y2).zip(arr).to_h
          search
        end
        Search.import! searches, on_duplicate_key_update: %i(x1 y1 x2 y2)

        rates = table['rates'].map do |name, value|
          rate = action_state.rates.find_or_initialize_by(name: name)
          rate.value = value.to_i
          rate
        end
        Rate.import! rates, on_duplicate_key_update: [:value]

        action_state.targets.destroy_all
        targets = table['targets'].map do |value|
          Target.new(action_state: action_state, value: value.to_i)
        end
        Target.import! targets, on_duplicate_key_update: [:value]
      end

      def import_action_chain(table)
        LuaScript::Importers::ActionChain.import(@project, table)
      end

      def import_exaction(table)

      end
  end
end
