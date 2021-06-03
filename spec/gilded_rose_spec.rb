require 'gilded_rose'

describe GildedRose do
  let(:sulfuras) { double :item, name: "Sulfuras, Hand of Ragnaros", sell_in: 10000, quality: 80 }
  let(:subject) { GildedRose.new([sulfuras]) }

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    context "Sulfuras" do
      it 'does not change sell in' do
        expect { subject.update_quality() }.to change { sulfuras.sell_in }.by 0
      end

      it 'does not change quality'  do
        expect { subject.update_quality() }.to change { sulfuras.quality }.by 0
      end
    end

  end

end
