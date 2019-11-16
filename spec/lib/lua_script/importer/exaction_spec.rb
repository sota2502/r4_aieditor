require "rails_helper"
require 'lua_script/importers/exaction'

describe LuaScript::Importers::Exaction do
  let(:project) { create(:project) }
  let(:action_state) { create(:action_state, project: project) }
  let(:search_name) { 'サーチ1' }
  let(:rate_name) { '変数1' }
  let(:action_chain_name) { '行動リスト1' }
  let(:table) do
    {
      'action' => [
        [
          {
            'search' => search_name,
            'target' => 0,
            'action' => action_chain_name,
            'rate' => [ rate_name, 10 ],
            'motion' => "normal"
          }
        ],
        [
          {
            'cancel' => 2,
            'search' => search_name,
            'target' => 0,
            'action' => action_chain_name,
            'rate' => [ rate_name, 20 ],
            'motion' => "normal"
          },
        ]
      ],
      'condition' => [ 70, 50 ],
      'name' => "ルーチン1"
    }
  end

  before do
    create(:rate, action_state: action_state, name: rate_name)
    create(:search, action_state: action_state, name: search_name)
    create(:target, action_state: action_state)
    create(:action_chain, project: project, name: action_chain_name)
  end

  it '#import' do
    expect {
      described_class.import(project, table)
    }.not_to raise_error

    exaction = project.exaction
    expect(exaction.present?).to be_truthy

    expect(exaction.hp_conditions.present?).to be_truthy
    exaction.hp_conditions.each do |hp_condition|
      expect(hp_condition.action_routines.present?).to  be_truthy
    end
  end
end
