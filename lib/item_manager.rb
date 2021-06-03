# frozen_string_literal: true

class ItemManager
  STANDARD_DEGREDATION = 1
  MINIMUM_QUALITY = 0
  EXPIRED_LIMIT = 0
  MAXIMUM_QUALITY = 50

  def self.update_standard_item(item)
    update_sellin(item)
    item.quality -= if expired?(item)
                      2 * STANDARD_DEGREDATION
                    else
                      STANDARD_DEGREDATION
                    end
    set_minimum_quality(item)
  end

  def self.update_backstage_pass(item)
    update_sellin(item)
    return item.quality = MINIMUM_QUALITY if expired?(item)

    item.quality += if item.sell_in < 5
                      3 * STANDARD_DEGREDATION
                    elsif item.sell_in < 10
                      2 * STANDARD_DEGREDATION
                    else
                      STANDARD_DEGREDATION
                    end
    set_maximum_quality(item)
  end

  def self.update_brie(item)
    update_sellin(item)
    item.quality += if expired?(item)
                      2 * STANDARD_DEGREDATION
                    else
                      STANDARD_DEGREDATION
                    end
    set_maximum_quality(item)
  end

  def self.update_conjured(item)
    conjured_degredation = 2 * STANDARD_DEGREDATION
    update_sellin(item)
    item.quality -= if expired?(item)
                      2 * conjured_degredation
                    else
                      conjured_degredation
                    end
    set_minimum_quality(item)
  end

  def self.below_minimum_quality?(item)
    item.quality < MINIMUM_QUALITY
  end

  def self.expired?(item)
    item.sell_in < EXPIRED_LIMIT
  end

  def self.above_max_quality?(item)
    item.quality > MAXIMUM_QUALITY
  end

  def self.update_sellin(item)
    item.sell_in -= 1
  end

  def self.set_minimum_quality(item)
    item.quality = MINIMUM_QUALITY if below_minimum_quality?(item)
  end

  def self.set_maximum_quality(item)
    item.quality = MAXIMUM_QUALITY if above_max_quality?(item)
  end
end
