# frozen_string_literal: true

class Sulfuras
  attr_reader :name, :sell_in, :quality

  def initialize(sell_in, quality)
    @name = 'Sulfuras, Hand of Ragnaros'
    @sell_in = sell_in
    @quality = quality
  end
end
