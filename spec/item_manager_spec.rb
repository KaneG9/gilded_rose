require 'item_manager'

describe ItemManager do
  it "quality cannot go below 0" do
    items = [Item.new("foo", 0, 0)]
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq 0
  end

  it "quality cannot exceed 50" do
    items = [Item.new("Aged Brie", 10, 50)]
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq 50
  end
end