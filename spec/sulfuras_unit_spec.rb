# frozen_string_literal: true

# frozen_string_literal: true

require './lib/sulfuras'

describe Sulfuras do
  describe '#update' do
    it 'sell_in doesnt decrease when update is executed' do
      sulfuras = Sulfuras.new('Sulfuras, Hand of Ragnaros', 1, 80)
      sulfuras.update
      expect(sulfuras.sell_in).to eq 1
    end

    it 'sell_in doesnt decrease when update is executed, even when 0 is entered' do
      sulfuras = Sulfuras.new('Sulfuras, Hand of Ragnaros', 0, 80)
      sulfuras.update
      expect(sulfuras.sell_in).to eq 0
    end

    it 'quality is unaffected by sell_in decreasing' do
      sulfuras = Sulfuras.new('Sulfuras, Hand of Ragnaros', 1, 80)
      sulfuras.update
      expect(sulfuras.quality).to eq 80
    end

    it 'quality is unaffected by sell_in decreasing past 0' do
      sulfuras = Sulfuras.new('Sulfuras, Hand of Ragnaros', 0, 80)
      sulfuras.update
      expect(sulfuras.quality).to eq 80
    end
  end
end
