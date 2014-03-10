require 'spec_helper'

module FantasyBaseball

  describe DataLoader do

    before(:all) do
      file_path = File.expand_path('data/Master-small.csv')
      data_loader = DataLoader.new
      @roster = data_loader.load_player_roster(file_path)
    end

    describe "data loader for roster" do
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

    describe "data loader for batting data" do
      before(:each) do
        batting_file_path = File.expand_path('data/Batting-07-12.csv')
        data_loader = DataLoader.new
        @batters = data_loader.load_batting_data(File.expand_path(batting_file_path), @roster)
        @batter_to_test = @batters[3]
      end

      it "should be a kind of array" do
        expect(@batters).to be_kind_of(Array)
      end

      it "should have a valid batter_data_by_year" do
        expect(@batter_to_test.batter_data_by_year.player_id).to eq(@player_id="abreubo01")
        expect(@batter_to_test.batter_data_by_year.year_id).to eq(@year_id="2012")
        expect(@batter_to_test.batter_data_by_year.league).to eq(@league="AL")
        expect(@batter_to_test.batter_data_by_year.team_id).to eq(@team_id="LAA")
        expect(@batter_to_test.batter_data_by_year.games).to eq(@games=8)
        expect(@batter_to_test.batter_data_by_year.at_bats).to eq(@at_bats=24)
        expect(@batter_to_test.batter_data_by_year.runs).to eq(@runs=1)
        expect(@batter_to_test.batter_data_by_year.hits).to eq(@hits=5)
        expect(@batter_to_test.batter_data_by_year.doubles).to eq(@doubles=3)
        expect(@batter_to_test.batter_data_by_year.triples).to eq(@triples=0)
        expect(@batter_to_test.batter_data_by_year.home_runs).to eq(@home_runs=0)
        expect(@batter_to_test.batter_data_by_year.runs_batted_in).to eq(@runs_batted_in=5)
        expect(@batter_to_test.batter_data_by_year.stolen_bases).to eq(@stolen_bases=0)
        expect(@batter_to_test.batter_data_by_year.caught_stealing).to eq(@caught_stealing=0)
        expect(@batter_to_test.batter_data_by_year.batting_average).to eq(@batting_average=0.208)
      end
    end

  end
end

