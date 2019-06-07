# frozen_string_literal: true

# require File.join(File.dirname(__FILE__), 'gilded_rose')

require './lib/gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Normal.new(0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end
  end
end
