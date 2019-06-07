# frozen_string_literal: true

require_relative 'normal'

class GildedRose
  def initialize(items)
    @items = items
  end

  def normal_update(item)
    item.sell_in -= 1
    return if item.quality == 0

    item.quality -= 1
    item.quality -= 1 if item.sell_in <= 0
  end

  def aged_brie_update(item)
    item.sell_in -= 1
    return if item.quality == 50

    item.quality += 1
    item.quality += 1 if item.sell_in <= 0
  end

  def backstage_pass_update(item)
    item.sell_in -= 1
    return if item.quality == 0

    item.quality += 1
    item.quality += 1 if item.sell_in <= 10
    item.quality += 1 if item.sell_in < 5
    item.quality = 0 if item.sell_in < 0
  end

  def update_quality
    @items.each do |item|
      if item.name == 'foo' # add method for assessing normal names?
        item.update
      elsif item.name == 'Aged Brie'
        aged_brie_update(item)
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
        backstage_pass_update(item)
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
