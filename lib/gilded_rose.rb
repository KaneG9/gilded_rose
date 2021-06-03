require_relative 'item.rb'
require_relative 'quality_manager.rb'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      next if item.name == "Sulfuras, Hand of Ragnaros"
      case item.name
      when "Aged Brie"
        QualityManager.update_brie(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        QualityManager.update_backstage_pass(item)
      else
        QualityManager.update_standard_item(item)
      end
      item.sell_in -= 1
    end
  end
end

      
      
      

