# frozen_string_literal: true

require '././lib/gilded_rose'

describe GildedRose do
  describe 'aged brie' do
    it 'decreases SellIn by 1 when update is executed' do
      items = [Item.new('Aged Brie', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 9
    end

    it 'increases Quality by 1 when update is executed' do
      items = [Item.new('Aged Brie', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 11
    end

    it 'cant exceed a quality of 50' do
      items = [Item.new('Aged Brie', 10, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
    end

    it 'quality increases twice as fast after sell_in date passes' do
      items = [Item.new('Aged Brie', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 2
    end
  end
end
