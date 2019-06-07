# frozen_string_literal: true

require '././lib/gilded_rose'
require './lib/sulfuras'

describe GildedRose do
  describe 'Sulfuras, Hand of Ragnaros' do
    it 'sell_in doesnt decrease when update is executed' do
      items = [Sulfuras.new(1, 80)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 1
    end

    it 'sell_in doesnt decrease when update is executed, even when 0 is entered' do
      items = [Sulfuras.new(0, 80)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 0
    end

    it 'quality is unaffected by sell_in decreasing' do
      items = [Sulfuras.new(1, 80)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 80
    end

    it 'quality is unaffected by sell_in decreasing past 0' do
      items = [Sulfuras.new(0, 80)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 80
    end
  end
end
