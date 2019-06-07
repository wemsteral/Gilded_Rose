# frozen_string_literal: true

class Normal
  attr_reader :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update
    @sell_in -= 1
    return if @quality == 0

    @quality -= 1
    @quality -= 1 if @sell_in <= 0
  end
end
