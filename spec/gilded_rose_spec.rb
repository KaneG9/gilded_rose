require 'gilded_rose'

describe GildedRose do
  let(:item_manager_double) { double :item_manager }
  before do
    allow(item_manager_double).to receive(:update_brie)
    allow(item_manager_double).to receive(:update_backstage_pass)
    allow(item_manager_double).to receive(:update_standard_item)
    allow(item_manager_double).to receive(:update_conjured)
  end

  describe "#update_quality" do
    it 'calls update_brie if brie item' do
      items = [Item.new("Aged Brie", 10, 50)]
      expect(item_manager_double).to receive(:update_brie)
      GildedRose.new(items, item_manager_double).update_quality()
    end

    it 'calls update_backstage_pass if backstage pass item' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 50)]
      expect(item_manager_double).to receive(:update_backstage_pass)
      GildedRose.new(items, item_manager_double).update_quality()
    end

    it 'calls update_standard_item if standard item' do
      items = [Item.new("foo", 10, 50)]
      expect(item_manager_double).to receive(:update_standard_item)
      GildedRose.new(items, item_manager_double).update_quality()
    end

    it 'does nothing if sulfuras item' do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 50)]
      expect { GildedRose.new(items, item_manager_double).update_quality() }.to change { items[0].sell_in }. by 0
    end

    it 'calls update_conjured if conjured item' do
      items = [Item.new("Conjured", 10, 50)]
      expect(item_manager_double).to receive(:update_conjured)
      GildedRose.new(items, item_manager_double).update_quality()
    end
  end

end
