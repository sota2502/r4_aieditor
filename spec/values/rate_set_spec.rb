require "rails_helper"

describe RateSet do
  describe '#for_lua' do
    let(:rate_set) { described_class.new(*args) }

    context 'given not nil' do
      let(:args) { [ Rate.new(name: 'test', value: 100), 50 ] }
      let(:expected) { ['test', 50] }
      it { expect(rate_set.for_lua).to eq expected }
    end

    context 'rate is nil' do
      let(:args) { [ nil, 50 ] }
      let(:expected) { [nil, 50] }
      it { expect(rate_set.for_lua).to eq expected }
    end

    context 'rate_coefficient is nil' do
      let(:args) { [ Rate.new(name: 'test', value: 100), nil ] }
      let(:expected) { ['test', nil] }
      it { expect(rate_set.for_lua).to eq expected }
    end

    context 'given nil' do
      let(:args) { [ nil, nil ] }
      let(:expected) { nil }
      it { expect(rate_set.for_lua).to eq expected }
    end
  end
end
