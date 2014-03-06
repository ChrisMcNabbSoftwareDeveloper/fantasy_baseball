require 'spec_helper'

module FantasyBaseball

  describe DataLoader do

    before(:each) do
      file_name = 'data/Batting-07-12.csv'
      @file_path = File.expand_path(file_name)
    end

    describe "data loader" do
      it "should be a kind of data loader" do
      data_loader = DataLoader.new(@file_path)
       expect(data_loader).to be_kind_of(DataLoader)
      end

      it "should load batter data" do
       data_loader = DataLoader.new(@file_path)
       data_loader.load_batter_data
      end

    end
  end

end
