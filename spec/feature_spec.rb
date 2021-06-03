# frozen_string_literal: true

require 'gilded_rose'

describe 'feature' do
  context 'in date' do
    let(:sulfuras) { Item.new('Sulfuras, Hand of Ragnaros', 100, 80) }
    let(:standard) { Item.new('standard item', 10, 18) }
    let(:aged_brie) { Item.new('Aged Brie', 10, 18) }
    let(:backstage_pass) { Item.new('Backstage passes to a TAFKAL80ETC concert', 20, 18) }
    let(:backstage_pass_2) { Item.new('Backstage passes to a TAFKAL80ETC concert', 9, 18) }
    let(:backstage_pass_3) { Item.new('Backstage passes to a TAFKAL80ETC concert', 2, 18) }
    let(:conjured) { Item.new('Conjured', 10, 10) }
    let(:subject) do
      GildedRose.new([sulfuras,
                      standard,
                      aged_brie,
                      backstage_pass,
                      backstage_pass_2,
                      backstage_pass_3,
                      conjured])
    end
    context 'Sulfuras' do
      it 'does not change sell in' do
        expect { subject.update_quality }.to change { sulfuras.sell_in }.by 0
      end

      it 'does not change quality' do
        expect { subject.update_quality }.to change { sulfuras.quality }.by 0
      end
    end

    context 'standard item' do
      it 'reduces sell in by 1' do
        expect { subject.update_quality }.to change { standard.sell_in }.by(-1)
      end

      it 'reduces the quality by 1' do
        expect { subject.update_quality }.to change { standard.quality }.by(-1)
      end
    end

    context 'Aged brie' do
      it 'reduces sell in by 1' do
        expect { subject.update_quality }.to change { aged_brie.sell_in }.by(-1)
      end

      it 'increases the quality by 1' do
        expect { subject.update_quality }.to change { aged_brie.quality }.by 1
      end
    end

    context 'backstage pass, sell in > 10' do
      it 'reduces sell in by 1' do
        expect { subject.update_quality }.to change { backstage_pass.sell_in }.by(-1)
      end

      it 'increases the quality by 1' do
        expect { subject.update_quality }.to change { backstage_pass.quality }.by 1
      end
    end

    context 'backstage pass, sell in < 10' do
      it 'reduces sell in by 1' do
        expect { subject.update_quality }.to change { backstage_pass_2.sell_in }.by(-1)
      end

      it 'increases the quality by 2' do
        expect { subject.update_quality }.to change { backstage_pass_2.quality }.by 2
      end
    end

    context 'backstage pass, sell in < 5' do
      it 'reduces sell in by 1' do
        expect { subject.update_quality }.to change { backstage_pass_3.sell_in }.by(-1)
      end

      it 'increases the quality by 3' do
        expect { subject.update_quality }.to change { backstage_pass_3.quality }.by 3
      end
    end

    context 'conjured item' do
      it 'reduces sell in by 1' do
        expect { subject.update_quality }.to change { conjured.sell_in }.by(-1)
      end

      it 'reduces the quality by 2' do
        expect { subject.update_quality }.to change { conjured.quality }.by(-2)
      end
    end
  end

  context 'expired' do
    let(:sulfuras) { Item.new('Sulfuras, Hand of Ragnaros', -1, 80) }
    let(:standard) { Item.new('standard item', -1, 18) }
    let(:aged_brie) { Item.new('Aged Brie', -1, 18) }
    let(:backstage_pass) { Item.new('Backstage passes to a TAFKAL80ETC concert', -1, 18) }
    let(:conjured) { Item.new('Conjured', -10, 10) }
    let(:subject) do
      GildedRose.new([sulfuras,
                      standard,
                      aged_brie,
                      backstage_pass,
                      conjured])
    end
    context 'Sulfuras' do
      it 'does not change sell in' do
        expect { subject.update_quality }.to change { sulfuras.sell_in }.by 0
      end

      it 'does not change quality' do
        expect { subject.update_quality }.to change { sulfuras.quality }.by 0
      end
    end

    context 'standard item' do
      it 'reduces sell in by 1' do
        expect { subject.update_quality }.to change { standard.sell_in }.by(-1)
      end

      it 'reduces the quality by 2' do
        expect { subject.update_quality }.to change { standard.quality }.by(-2)
      end
    end

    context 'Aged brie' do
      it 'reduces sell in by 1' do
        expect { subject.update_quality }.to change { aged_brie.sell_in }.by(-1)
      end

      it 'increases the quality by 1' do
        expect { subject.update_quality }.to change { aged_brie.quality }.by 2
      end
    end

    context 'backstage pass' do
      it 'reduces sell in by 1' do
        expect { subject.update_quality }.to change { backstage_pass.sell_in }.by(-1)
      end

      it 'quality is equal to 0' do
        subject.update_quality
        expect(backstage_pass.quality).to eq 0
      end
    end

    context 'conjured item' do
      it 'reduces sell in by 1' do
        expect { subject.update_quality }.to change { conjured.sell_in }.by(-1)
      end

      it 'reduces the quality by 4' do
        expect { subject.update_quality }.to change { conjured.quality }.by(-4)
      end
    end
  end
end
