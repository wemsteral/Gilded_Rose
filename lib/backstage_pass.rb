# frozen_string_literal: true

require_relative 'gilded_rose'
require_relative 'item'

class BackStagePass < Item
  def update
    @sell_in -= 1
    return if @quality == 0

    @quality += 1
    @quality += 1 if @sell_in <= 10
    @quality += 1 if @sell_in < 5
    @quality = 0 if @sell_in < 0
  end
end
