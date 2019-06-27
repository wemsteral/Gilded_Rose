# frozen_string_literal: true

require './lib/backstage_pass'

describe BackStagePass do
  describe '#update' do
    it 'decreases SellIn by 1 when update is executed' do
      bsp = BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 15, 20)
      bsp.update
      expect(bsp.sell_in).to eq 14
    end

    it 'quality increases by 1 per update when more than 10 days are left' do
      bsp = BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 15, 20)
      bsp.update
      expect(bsp.quality).to eq 21
    end

    it 'quality increases by 2 per update when there are 6-10 days left (inclusive)' do
      bsp = BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 10, 20)
      bsp2 = BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 9, 20)
      bsp3 = BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 8, 20)
      bsp4 = BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 7, 20)
      bsp5 = BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 6, 20)
      bsp.update
      bsp2.update
      bsp3.update
      bsp4.update
      bsp5.update
      expect(bsp.quality).to eq 22
      expect(bsp2.quality).to eq 22
      expect(bsp3.quality).to eq 22
      expect(bsp4.quality).to eq 22
      expect(bsp5.quality).to eq 22
    end

    it 'quality increases by 3 per update when there are 1-5 days left (inclusive)' do
      bsp = BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 5, 20)
      bsp2 = BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 4, 20)
      bsp3 = BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 3, 20)
      bsp4 = BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 2, 20)
      bsp5 = BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 1, 20)
      bsp.update
      bsp2.update
      bsp3.update
      bsp4.update
      bsp5.update
      expect(bsp.quality).to eq 23
      expect(bsp2.quality).to eq 23
      expect(bsp3.quality).to eq 23
      expect(bsp4.quality).to eq 23
      expect(bsp5.quality).to eq 23
    end

    it 'quality increases to 0 after expiration' do
      bsp = BackStagePass.new('Backstage passes to a TAFKAL80ETC concert', 0, 20)
      bsp.update
      expect(bsp.quality).to eq 0
    end
  end
end
