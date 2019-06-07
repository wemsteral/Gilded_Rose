#!/usr/bin/ruby -w
# frozen_string_literal: true

require './lib/gilded_rose.rb'
require './lib/normal.rb'
require './lib/aged_brie.rb'

puts 'OMGHAI!'
items = [
  Normal.new(10, 20),
  AgedBrie.new(2, 0),
  Normal.new(5, 7),
  Item.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = 0, quality = 80),
  Item.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = -1, quality = 80),
  Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 15, quality = 20),
  Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 49),
  Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 5, quality = 49),
  # This Conjured item does not work properly yet
  Item.new(name = 'Conjured Mana Cake', sell_in = 3, quality = 6) # <-- :O
]

days = 2
days = ARGV[0].to_i + 1 unless ARGV.empty?

gilded_rose = GildedRose.new items
(0...days).each do |day|
  puts "-------- day #{day} --------"
  puts 'name, sellIn, quality'
  items.each do |item|
    puts item
  end
  puts ''
  gilded_rose.update_quality
end
