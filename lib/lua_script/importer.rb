require 'rlua'

module LuaScript
  class Importer
    attr_reader :project, :lua_string

    def initialize(project, lua_string)
      @project = project
      @lua_string = lua_string
    end

    def import
      ApplicationRecord.transaction do
        table = lua_table
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
        return state.stash
      end

      def import_action_state(table)
        action_state = ActionState.includes(:searches, :rates, :targets)
                                  .find_or_initialize_by(project: @project)
        action_state.attributes = table.to_hash.slice('chara', 'field', 'freq', 'precis')
        action_state.save!

        param = table.to_hash
        searches = param.delete('searches').to_hash.map do |name, pos|
          arr = pos.to_a.map(&:to_i)
          search = action_state.searches.find_or_initialize_by(name: name)
          search.attributes = { x1: arr[0], y1: arr[1], x2: arr[2], y2: arr[3] }
          search
        end
        Search.import! searches

        rates = param.delete('rates').to_hash.map do |name, value|
          rate = action_state.rates.find_or_initialize_by(name: name)
          rate.value = value.to_i
          rate
        end
        Rate.import! rates

        # targets = param.delete('targets').to_a.map { |e| Target.new(value: e.to_i) }
      end

      def import_action_chain(table)

      end

      def import_exaction(table)

      end
  end
end
