require 'rlua'
module LuaScript
  class Dumper
    class << self
      def dump(obj)
        state = Lua::State.new
        state.__load_stdlib :all
        state.obj = obj.deep_stringify_keys
        state.__eval "pl_pretty = require 'pl.pretty'"
        state.__eval "result = pl_pretty.write(obj)"
        return state.result
      end

      def dump_with_func(name, obj)
        "#{name} #{dump(obj)}"
      end
    end
  end
end
