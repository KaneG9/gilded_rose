class ItemManager

  STANDARD_DEGREDATION = 1
  MINIMUM_QUALITY = 0
  EXPIRED_LIMIT = 0
  MAXIMUM_QUALITY = 50

  def self.update_standard_item(item)
    update_sellin(item)
    if expired?(item)
      item.quality -= 2 * STANDARD_DEGREDATION
    else
      item.quality -= STANDARD_DEGREDATION
    end 
    item.quality = MINIMUM_QUALITY if below_minimum_quality?(item)
  end

  def self.update_backstage_pass(item)
    update_sellin(item)
    return item.quality = MINIMUM_QUALITY if expired?(item)
    if item.sell_in < 5 
      item.quality += 3 * STANDARD_DEGREDATION
    elsif item.sell_in < 10
      item.quality += 2 * STANDARD_DEGREDATION
    else
      item.quality += STANDARD_DEGREDATION
    end
    item.quality = MAXIMUM_QUALITY if above_max_quality?(item)
  end

  def self.update_brie(item)
    update_sellin(item)
    if expired?(item)
      item.quality += 2 * STANDARD_DEGREDATION
    else
      item.quality += STANDARD_DEGREDATION
    end
    item.quality = MAXIMUM_QUALITY if above_max_quality?(item)
  end

  private

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
end