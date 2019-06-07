# frozen_string_literal: true

require './lib/aged_brie'

describe AgedBrie do
  describe '#update' do
    it 'decreases SellIn by 1 when update is executed' do
      agedbrie = AgedBrie.new(10, 10)
      agedbrie.update
      expect(agedbrie.sell_in).to eq 9
    end

    it 'increases Quality by 1 when update is executed' do
      agedbrie = AgedBrie.new(10, 10)
      agedbrie.update
      expect(agedbrie.quality).to eq 11
    end

    it 'cant exceed a quality of 50' do
      agedbrie = AgedBrie.new(10, 50)
      agedbrie.update
      expect(agedbrie.quality).to eq 50
    end

    it 'quality increases twice as fast after sell_in date passes' do
      agedbrie = AgedBrie.new(0, 0)
      agedbrie.update
      expect(agedbrie.quality).to eq 2
    end
  end
end
