#!/usr/bin/ruby -w
# frozen_string_literal: true

require './lib/gilded_rose.rb'
require './lib/normal.rb'
require './lib/aged_brie.rb'
require './lib/sulfuras.rb'

puts 'OMGHAI!'
items = [
  Item.new('AK47', 10, 20),
  Item.new('Aged Brie', 2, 0),
  Item.new('Elixir of the Mongoose', 5, 7),
  Item.new('Sulfuras, Hand of Ragnaros', 0, 80),
  Item.new('Sulfuras, Hand of Ragnaros', -1, 80),
  Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 20),
  Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 49),
  Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 49),
  # This Conjured item does not work properly yet
  Item.new('Conjured Mana Cake', 3, 6) # <-- :O
]

days = 2
days = ARGV[0].to_i + 1 unless ARGV.empty?

gilded_rose = GildedRose.new items
(0...days).each do |day|
  puts "-------- day #{day} --------"
  puts 'name, sellIn, quality'
  gilded_rose.items.each do |item|
    puts item.to_s
  end
  puts ''
  gilded_rose.update_quality
end
