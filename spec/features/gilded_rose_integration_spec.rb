# frozen_string_literal: true

require './lib/gilded_rose'

describe GildedRose do
  describe '#initialize / Item conversion into subclass' do
    it 'turns an item with the relevant name into a sub class of that name' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80),
               Item.new('Aged Brie', 4, 20),
               Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 20),
               Item.new('Conjured Mana Cake', 4, 20)]

      GildedRose.new(items)
      expect(items[0]).to be_a Sulfuras
      expect(items[1]).to be_a AgedBrie
      expect(items[2]).to be_a BackStagePass
      expect(items[3]).to be_a Conjured
    end

    it 'turns an item with any other name into a normal item' do
      items = [Item.new('foo', 4, 20),
               Item.new('bar', 4, 20),
               Item.new('nutella', 4, 20),
               Item.new('top gear magazine', 4, 20)]

      GildedRose.new(items)
      expect(items[0]).to be_a Normal
      expect(items[1]).to be_a Normal
      expect(items[2]).to be_a Normal
      expect(items[3]).to be_a Normal
    end
  end
end
