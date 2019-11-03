require "rails_helper"
require_relative '../../../lib/lua_script/dumper'

describe LuaScript::Dumper do
  before :all do
    system "$(luarocks path --bin)"
    p ENV
  end
  it '#dump' do
    obj = { name: 'Test' }
    expected = "{\n  name = \"Test\"\n}"
    expect(LuaScript::Dumper.dump(obj)).to eq expected
  end
end
