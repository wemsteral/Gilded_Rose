# frozen_string_literal: true

require './lib/normal'

describe Normal do
  describe '#update' do
    it 'reduces its @sell_in value by 1' do
      normal = Normal.new('foo', 10, 10)
      normal.update
      expect(normal.sell_in).to eq 9
    end

    it 'reduces its @quality value by 1' do
      normal = Normal.new('foo', 10, 10)
      normal.update
      expect(normal.quality).to eq 9
    end

    it 'doesnt allow quality to go below 0' do
      normal = Normal.new('foo', 10, 0)
      normal.update
      expect(normal.quality).to eq 0
    end

    it 'once SellIn is 0 quality degrades by 2 per update' do
      normal = Normal.new('foo', 0, 4)
      normal.update
      expect(normal.quality).to eq 2
    end
  end
end
