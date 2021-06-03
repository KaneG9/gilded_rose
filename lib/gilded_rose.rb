require_relative 'item.rb'
require_relative 'item_manager.rb'

class GildedRose

  def initialize(items, manager = ItemManager)
    @items = items
    @manager = manager
  end

  def update_quality()
    @items.each do |item|
      next if item.name == "Sulfuras, Hand of Ragnaros"
      case item.name
      when "Aged Brie"
        @manager.update_brie(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        @manager.update_backstage_pass(item)
      when "Conjured"
        @manager.update_conjured(item)
      else
        @manager.update_standard_item(item)
      end
    end
  end
end

      
      
      

