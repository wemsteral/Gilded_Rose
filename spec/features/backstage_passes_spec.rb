# frozen_string_literal: true

describe GildedRose do
  describe 'Backstage passes to a TAFKAL80ETC concert' do
    it 'decreases SellIn by 1 when update is executed' do
      items = [BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 15, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 14
    end

    it 'quality increases by 1 per update when more than 10 days are left' do
      items = [BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 15, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 21
    end

    it 'quality increases by 2 per update when there are 6-10 days left (inclusive)' do
      items = [BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 10, 20),
               BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 9, 20),
               BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 8, 20),
               BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 7, 20),
               BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 6, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 22
      expect(items[1].quality).to eq 22
      expect(items[2].quality).to eq 22
      expect(items[3].quality).to eq 22
      expect(items[4].quality).to eq 22
    end

    it 'quality increases by 3 per update when there are 1-5 days left (inclusive)' do
      items = [BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 5, 20),
               BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 4, 20),
               BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 3, 20),
               BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 2, 20),
               BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 1, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 23
      expect(items[1].quality).to eq 23
      expect(items[2].quality).to eq 23
      expect(items[3].quality).to eq 23
      expect(items[4].quality).to eq 23
    end

    it 'quality increases to 0 after expiration' do
      items = [BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 0, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end
  end
end
