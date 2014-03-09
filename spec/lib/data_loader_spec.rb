require 'spec_helper'

module FantasyBaseball

  describe DataLoader do

    describe "data loader for roster" do
      before(:each) do
        file_path = File.expand_path('data/Master-small.csv')
        data_loader = DataLoader.new
        @roster = data_loader.load_player_roster(file_path)
      end

      it "should be a kind of array" do
        expect(@roster).to be_kind_of(Array)
      end
      it "should have a valid player_id" do
        expect(@roster[0].player_id).to eq("aaronha01")
      end
      it "should have a valid player_first_name" do
        expect(@roster[0].player_first_name).to eq("Hank")
      end
      it "should have a valid player_last_name" do
        expect(@roster[0].player_last_name).to eq("Aaron")
      end
      it "should have a valid player_birth_year" do
        expect(@roster[0].player_birth_year).to eq("1934")
      end
      it "should have a valid player_full_name" do
        expect(@roster[0].player_full_name).to eq("Hank Aaron")
      end
    end

    describe "data loader for roster" do
      before(:each) do
        @file_path = File.expand_path('data/Master-small.csv')
        @roster = DataLoader.new
      end

      xit "should return an ArgumentError if no file_path parameter passed" do
        expect(@roster.load_player_roster).to raise_error
      end
    end

    describe "data loader for batting data" do
      before(:each) do
        roster_file_name = 'data/Master-small.csv'
        roster = DataLoader.new
        roster.load_player_roster(File.expand_path(roster_file_name))
        batting_file_name = 'data/Batting-07-12.csv'
        data_loader = DataLoader.new
        @batters = data_loader.load_batting_data(File.expand_path(batting_file_name), roster)
      end

      it "should be a kind of array" do
        expect(@batters).to be_kind_of(Array)
      end
    end

    describe "data loader for batting data" do
      before(:each) do
        roster_file_name = 'data/Master-small.csv'
        roster = DataLoader.new
        roster.load_player_roster(File.expand_path(roster_file_name))
        batting_file_name = 'data/Batting-07-12.csv'
        data_loader = DataLoader.new
        @batters = data_loader.load_batting_data(nil,nil)
      end

      xit "should return an ArgumentError if no file_path parameter passed" do
        expect(@batters).to raise_error
      end
    end

    pending    describe "#load_batter_data" do
      before(:all) do
        file_name = 'data/Batting-07-12.csv'
        data_loader = DataLoader.new(File.expand_path(file_name))
        batters = data_loader.load_batter_data
        @batter_to_test = batters[3]
        @batter_data_by_year = @batter_to_test.batter_data_by_year[0]
        @first_batter_data_by_year = @batter_data_by_year[:batter_data_by_year]
      end

      it "should load batter data and verify batter 4's player_id" do
        expect(@batter_to_test.player_id).to eq("abreubo01")
      end
      it "should verify batter_data_by_year player_id" do
        expect(@batter_data_by_year[:player_id]).to eq("abreubo01")
      end
      it "should verify player_full_name" do
        expect(@batter_data_by_year[:player_full_name]).to eq("Hank Aaron")
      end
      it "should verify player id inside batter_data_by_year" do
        expect(@first_batter_data_by_year[:player_id]).to eq("abreubo01")
      end
      it "should verify year_id inside batter_data_by_year" do
        expect(@first_batter_data_by_year[:year_id]).to eq("2012")
      end
      it "should verify league inside batter_data_by_year" do
        expect(@first_batter_data_by_year[:league]).to eq("AL")
      end
      it "should verify team_id inside batter_data_by_year" do
        expect(@first_batter_data_by_year[:team_id]).to eq("LAA")
      end
      it "should verify games inside batter_data_by_year" do
        expect(@first_batter_data_by_year[:games]).to eq(8)
      end
      it "should verify at_bats inside batter_data_by_year" do
        expect(@first_batter_data_by_year[:at_bats]).to eq(24)
      end
      it "should verify runs inside batter_data_by_year" do
        expect(@first_batter_data_by_year[:runs]).to eq(1)
      end
      it "should verify hits inside batter_data_by_year" do
        expect(@first_batter_data_by_year[:hits]).to eq(5)
      end
      it "should verify doubles inside batter_data_by_year" do
        expect(@first_batter_data_by_year[:doubles]).to eq(3)
      end
      it "should verify triples inside batter_data_by_year" do
        expect(@first_batter_data_by_year[:triples]).to eq(0)
      end
      it "should verify home_runs inside batter_data_by_year" do
        expect(@first_batter_data_by_year[:home_runs]).to eq(0)
      end
      it "should verify runs_batted_in inside batter_data_by_year" do
        expect(@first_batter_data_by_year[:runs_batted_in]).to eq(5)
      end
      it "should verify stolen_bases inside batter_data_by_year" do
        expect(@first_batter_data_by_year[:stolen_bases]).to eq(0)
      end
      it "should verify caught_stealing inside batter_data_by_year" do
        expect(@first_batter_data_by_year[:caught_stealing]).to eq(0)
      end
      it "should verify batting_average inside batter_data_by_year" do
        expect(@first_batter_data_by_year[:batting_average]).to eq(0.208)
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
