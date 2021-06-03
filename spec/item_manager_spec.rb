require 'item_manager'

describe ItemManager do

  describe '#update_backstage_pass' do
    it 'reduces sell_in by 1' do
      pass = Item.new('backstage_pass', 20, 20)
      expect { described_class.update_backstage_pass(pass) }.to change { pass.sell_in }.by -1
    end

    it 'quality increases by 1 if sell in > 10' do
      pass = Item.new('backstage_pass', 20, 20)
      expect { described_class.update_backstage_pass(pass) }.to change { pass.quality }.by 1
    end

    it 'quality increases by 2 if 5 < sell in < 10 ' do
      pass = Item.new('backstage_pass', 7, 20)
      expect { described_class.update_backstage_pass(pass) }.to change { pass.quality }.by 2
    end

    it 'quality increases by 3 if sell in < 5' do
      pass = Item.new('backstage_pass', 2, 20)
      expect { described_class.update_backstage_pass(pass) }.to change { pass.quality }.by 3
    end

    it 'quality is 0 when expired' do
      pass = Item.new('backstage_pass', 0, 20)
      described_class.update_backstage_pass(pass)
      expect(pass.quality).to eq 0
    end

    it 'quality cannot exceed 50' do
      pass = Item.new('backstage_pass', 6, 50)
      described_class.update_backstage_pass(pass)
      expect(pass.quality).to eq 50
    end
  end

  describe '#update_standard_item' do
    it 'reduces sell_in by 1' do
      item = Item.new('standard_item', 20, 20)
      expect { described_class.update_standard_item(item) }.to change { item.sell_in }.by -1
    end

    it 'quality decreases by 1 if in date' do
      item = Item.new('standard_item', 20, 20)
      expect { described_class.update_standard_item(item) }.to change { item.quality }.by -1
    end

    it 'quality decreases by 2 if expired' do
      item = Item.new('standard_item', -1, 20)
      expect { described_class.update_standard_item(item) }.to change { item.quality }.by -2
    end

    it 'quality cannot go below 0' do
      item = Item.new('standard_item', -1, 0)
      described_class.update_standard_item(item)
      expect(item.quality).to eq 0
    end
  end

  describe '#update_brie' do
    it 'reduces sell_in by 1' do
      brie = Item.new('Aged Brie', 20, 20)
      expect { described_class.update_brie(brie) }.to change { brie.sell_in }.by -1
    end

    it 'quality increases by 1 if in date' do
      brie = Item.new('Aged Brie', 20, 20)
      expect { described_class.update_brie(brie) }.to change { brie.quality }.by 1
    end

    it 'quality increases by 2 if expired' do
      brie = Item.new('Aged Brie', -1, 20)
      expect { described_class.update_brie(brie) }.to change { brie.quality }.by 2
    end

    it 'quality cannot exceed 50' do
      brie = Item.new('Aged Brie', -1, 50)
      described_class.update_brie(brie)
      expect(brie.quality).to eq 50
    end
  end

  describe '#update_conjured' do
    it 'reduces sell_in by 1' do
      item = Item.new('conjured item', 20, 20)
      expect { described_class.update_conjured(item) }.to change { item.sell_in }.by -1
    end

    it 'quality decreases by 2 if in date' do
      item = Item.new('conjured_item', 20, 20)
      expect { described_class.update_conjured(item) }.to change { item.quality }.by -2
    end

    it 'quality decreases by 4 if expired' do
      item = Item.new('conjured_item', -1, 20)
      expect { described_class.update_conjured(item) }.to change { item.quality }.by -4
    end
  end
  
end
