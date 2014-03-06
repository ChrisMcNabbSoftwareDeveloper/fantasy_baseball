require 'spec_helper'

module FantasyBaseball

  describe DataLoader do

    describe "data loader" do

      before(:each) do
        file_name = 'data/Batting-07-12.csv'
        @file_path = File.expand_path(file_name)
        @data_loader = DataLoader.new(@file_path)
      end

      it "should be a kind of data loader" do
        expect(@data_loader).to be_kind_of(DataLoader)
      end

      it "should load batter data sucessfully and return true" do
        expect(@data_loader.load_batter_data).to eq(true)
      end
    end



  end

end
