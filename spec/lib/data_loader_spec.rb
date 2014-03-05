require 'spec_helper'

module FantasyBaseball

  describe DataLoader do

    describe "data loader" do
      it "should be a kind of data loader" do
      data_loader = DataLoader.new('../../data/Batting-07-12.csv')
       expect(data_loader).to be_kind_of(DataLoader)
      end

      it "should load batter data" do
       data_loader = DataLoader.new('../../data/Batting-07-12.csv')
       data_loader.load_batter_data
      end

    end
  end

end
