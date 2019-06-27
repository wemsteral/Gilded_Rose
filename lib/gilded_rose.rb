# frozen_string_literal: true

require_relative 'item'
require_relative 'normal'
require_relative 'aged_brie'
require_relative 'backstage_pass'
require_relative 'sulfuras'

class GildedRose
  attr_reader :items
  def initialize(items)
    @items = items.map! { |x| get_item_type(x.name).new(x.name, x.sell_in, x.quality) }
end

  def get_item_type(name)
    if name == 'Aged Brie'
      AgedBrie
    elsif name == 'Backstage passes to a TAFKAL80ETC concert'
      BackStagePass
    elsif name == 'Sulfuras, Hand of Ragnaros'
      Sulfuras
    else
      Normal
    end
  end

  def update_quality
    @items.each(&:update)
  end
end
