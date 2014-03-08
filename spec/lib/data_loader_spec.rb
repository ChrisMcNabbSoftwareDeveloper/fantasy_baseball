require 'spec_helper'

module FantasyBaseball

  describe DataLoader do

    before(:each) do
      file_name = 'data/Batting-07-12.csv'
      @file_path = File.expand_path(file_name)
      @data_loader = DataLoader.new(@file_path)
    end

pending    describe "data loader" do
      it "should be a kind of data loader" do
        expect(@data_loader).to be_kind_of(DataLoader)
      end
    end

    describe "#load_batter_data" do
      it "should load batter data and return true" do
        expect(@data_loader.load_batter_data).to eq(500)
      end
    end

    # private methods - usind tdd to drive out methods - will delete these tests afterward
pending    describe "get_data_by_year" do
      let(:row) { {'playerID' => 'aardsda01', 'yearID' => 2011, 'league' => 'AL', 'teamID' => 'LAA', 'G' => '142', 'AB' => 502, 'R' => 54, 'H' => 127, '2B' => 30, '3B' => 1, 'HR' => 8, 'RBI' => 60, 'SB' => 21, 'CS' => 5 } }
      let(:batter_data) { Batter.initialize_key_names row }

      it "should return data hash for year" do
        actual_hash = @data_loader.get_data_by_year(batter_data)
        compare_hash = {:player_id=>"aardsda01", :year_id=>2011,
                        :league=>"AL", :team_id=>"LAA", :games=>142,
                        :at_bats=>502, :runs=>54, :hits=>127,
                        :doubles=>30, :triples=>1, :home_runs=>8,
                        :runs_batted_in=>60, :stolen_bases=>21,
                        :caught_stealing=>5, :batting_average=>0.253
                        }
        expect(actual_hash).to eq(compare_hash)
      end
    end


  end

end
