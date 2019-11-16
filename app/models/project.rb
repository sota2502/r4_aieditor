class Project < ApplicationRecord
  has_one :action_state, dependent: :destroy
  has_many :action_chains, dependent: :destroy
  has_one :exaction, dependent: :destroy
  has_many :cancel_conditions, dependent: :destroy

  def to_lua
    [
      LuaScript::Dumper.dump_with_func('actionstate', action_state.for_lua),
      action_chains.map { |ac| LuaScript::Dumper.dump_with_func('actionchain', ac.for_lua) },
      LuaScript::Dumper.dump_with_func('exaction', exaction.for_lua),
    ].flatten.join("\n\n")
  end
end
