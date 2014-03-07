require 'spec_helper'

module FantasyBaseball

  describe DataLoader do

    before(:each) do
      file_name = 'data/Batting-07-12.csv'
      @file_path = File.expand_path(file_name)
      @data_loader = DataLoader.new(@file_path)
    end

    describe "data loader" do
      it "should be a kind of data loader" do
        expect(@data_loader).to be_kind_of(DataLoader)
      end
    end

    describe "#load_batter_data" do
      it "should load batter data and return true" do
        expect(@data_loader.load_batter_data).to eq(true)
      end
    end

  end

end
