class Project < ApplicationRecord
  has_one :action_state
  has_many :action_chains
  has_one :exaction
  has_many :cancel_conditions

  def to_lua
    [
      LuaScript::Dumper.dump_with_func('actionstate', action_state.for_lua),
      action_chains.map { |ac| LuaScript::Dumper.dump_with_func('actionchain', ac.for_lua) },
      LuaScript::Dumper.dump_with_func('exaction', exaction.for_lua),
    ].flatten.join("\n\n")
  end
end
