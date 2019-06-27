# frozen_string_literal: true

require './lib/conjured'

describe Conjured do
  describe '#update' do
    it 'reduces its @sell_in value by 1' do
      cmc = Conjured.new('Conjured Mana Cake', 10, 10)
      cmc.update
      expect(cmc.sell_in).to eq 9
    end

    it 'reduces its @quality value by 2 per update' do
      cmc = Conjured.new('Conjured Mana Cake', 10, 10)
      cmc.update
      expect(cmc.quality).to eq 8
    end

    it 'doesnt allow quality to go below 0' do
      cmc = Conjured.new('Conjured Mana Cake', 10, 0)
      cmc.update
      expect(cmc.quality).to eq 0
    end

    it 'once SellIn is 0 quality degrades by 4 per update' do
      cmc = Conjured.new('Conjured Mana Cake', 0, 4)
      cmc.update
      expect(cmc.quality).to eq 0
    end
  end
end
