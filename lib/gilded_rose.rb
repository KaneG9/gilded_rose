require_relative 'item.rb'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      next if item.name == "Sulfuras, Hand of Ragnaros"
      case item.name
      when "Aged Brie"
        item.quality += 1
        if item.sell_in <= 0
          if item.quality < 50
            item.quality += 1
          end
        end
      when "Backstage passes to a TAFKAL80ETC concert"
        item.quality += 1
        if item.sell_in < 11
          if item.quality < 50
            item.quality += 1
          end
        end
        if item.sell_in < 6
          if item.quality < 50
            item.quality += 1
          end
        end
        if item.sell_in <= 0
          item.quality = 0
        end
      else
        if item.quality > 0
          item.quality -= 1
        end
        if item.sell_in <= 0
          if item.quality > 0
            item.quality -= 1
          end
        end
      end
      item.sell_in -= 1
    end
  end
end

      
      
      

