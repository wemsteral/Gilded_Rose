# frozen_string_literal: true

class AgedBrie
  attr_reader :name, :sell_in, :quality

  def initialize(sell_in, quality)
    @name = 'Aged Brie'
    @sell_in = sell_in
    @quality = quality
  end

  def update
    @sell_in -= 1
    return if @quality == 50

    @quality += 1
    @quality += 1 if @sell_in <= 0
  end
end
