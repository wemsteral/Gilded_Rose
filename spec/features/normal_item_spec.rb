# frozen_string_literal: true

require '././lib/gilded_rose'

describe GildedRose do
  describe 'normal item' do
    it 'decreases SellIn by 1 when update is executed' do
      items = [Item.new('foo', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 9
    end

    it 'decreases Quality by 1 when update is executed' do
      items = [Item.new('foo', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 9
    end
  end
end
