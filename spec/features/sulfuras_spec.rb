# frozen_string_literal: true

require '././lib/gilded_rose'

describe GildedRose do
  describe 'Sulfuras, Hand of Ragnaros' do
    it 'sell_in doesnt decrease when update is executed' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 1, 80)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 1
    end

    it 'sell_in doesnt decrease when update is executed, even when 0 is entered' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 0
    end

    it 'quality is unaffected by sell_in decreasing' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 1, 80)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 80
    end

    it 'quality is unaffected by sell_in decreasing past 0' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 80
    end
  end
end
