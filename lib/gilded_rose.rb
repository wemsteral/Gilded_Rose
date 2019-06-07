# frozen_string_literal: true

require_relative 'normal'
require_relative 'aged_brie'
require_relative 'backstage_pass'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      puts item.name
      item.update
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
