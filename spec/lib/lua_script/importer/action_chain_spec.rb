require "rails_helper"
require 'lua_script/importers/action_chain'

describe LuaScript::Importers::ActionChain do
  let(:project) { create(:project) }
  let(:action_state) { create(:action_state, project: project) }
  let(:search_name) { 'サーチ1' }
  let(:rate_name) { '変数1' }
  let(:table) do
    {
      'name' => '行動リスト1',
      'cancel' => [
        [ 1, [ rate_name, 10 ], 10, 20 ]
      ],
      1.0 => {
        'way' => 0,
        'cancel' => [
          [ 1, [ rate_name, 100 ] ]
        ],
        'move' => [ 10, 10 ],
        'next' => 1,
        'target' => 0,
        'hold'   => 20,
        'search' => search_name,
        'motion' => "normal"
      }
    }
  end

  before do
    create(:rate, action_state: action_state, name: rate_name)
    create(:search, action_state: action_state, name: search_name)
    create(:target, action_state: action_state)
  end

  it '#import' do
    expect {
      described_class.import(project, table)
    }.not_to raise_error

    action_chain = project.action_chains.first
    expect(action_chain.name).to eq '行動リスト1'
    expect(action_chain.action_rules.exists?).to be_truthy
    expect(action_chain.cancel_conditions.exists?).to be_truthy

    action_rule = action_chain.action_rules.first
    expect(action_rule.cancel_conditions.exists?).to be_truthy
  end
end
