class QualityManager
  def self.update_standard_item(item)
    item.quality -= 1
    item.sell_in -= 1
  end
end