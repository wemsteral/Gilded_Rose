# frozen_string_literal: true

require '././lib/gilded_rose'
require './lib/normal'

describe GildedRose do
  describe 'normal item' do
    it 'decreases SellIn by 1 when update is executed' do
      items = [Normal.new(10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 9
    end

    it 'decreases Quality by 1 when update is executed' do
      items = [Normal.new(10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 9
    end

    it 'once SellIn is 0 quality degrades by 2 per update' do
      items = [Normal.new(0, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 8
    end

    it 'Quality cant be negative number' do
      items = [Normal.new(0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end
  end
end
