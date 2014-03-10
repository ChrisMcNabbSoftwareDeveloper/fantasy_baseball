require 'spec_helper'

module FantasyBaseball

  describe BatterDataByYear do
    describe "new batter data by year" do

      let(:row) { {'playerID' => 'aardsda01', 'yearID' => 2011, 'league' => 'AL', 'teamID' => 'LAA', 'G' => '142', 'AB' => 502, 'R' => 54, 'H' => 127, '2B' => 30, '3B' => 1, 'HR' => 8, 'RBI' => 60, 'SB' => 21, 'CS' => 5 } }
      let(:data) { Statistics.initialize_batting_data row }

      before(:each) do
        @batter_data_by_year = BatterDataByYear.new(data)
      end

      it "is a kind of BatterDataByYear" do
        expect(@batter_data_by_year).to be_a_kind_of(BatterDataByYear)
      end
      it "should have a valid player_id" do
        expect(@batter_data_by_year.player_id).to eq('aardsda01')
      end
      it "should have a valid year_id" do
        expect(@batter_data_by_year.year_id).to eq(2011)
      end
     it "should have a valid league" do
        expect(@batter_data_by_year.league).to eq('AL')
      end
      it "should have a valid team_id" do
        expect(@batter_data_by_year.team_id).to eq('LAA')
      end
      it "should have a valid games" do
        expect(@batter_data_by_year.games).to eq(142)
      end
      it "should have a valid at_bats" do
        expect(@batter_data_by_year.at_bats).to eq(502)
      end
      it "should have a valid runs" do
        expect(@batter_data_by_year.runs).to eq(54)
      end
      it "should have a valid hits" do
        expect(@batter_data_by_year.hits).to eq(127)
      end
      it "should have a valid doubles" do
        expect(@batter_data_by_year.doubles).to eq(30)
      end
      it "should have a valid triples" do
        expect(@batter_data_by_year.triples).to eq(1)
      end
      it "should have a valid home_runs" do
        expect(@batter_data_by_year.home_runs).to eq(8)
      end
      it "should have a valid runs_batted_in" do
        expect(@batter_data_by_year.runs_batted_in).to eq(60)
      end
      it "should have a valid stolen_bases" do
        expect(@batter_data_by_year.stolen_bases).to eq(21)
      end
      it "should have a valid caught_stealing" do
        expect(@batter_data_by_year.caught_stealing).to eq(5)
      end
      it "should have a valid batting average" do
        expect(@batter_data_by_year.batting_average).to eq(0.253)
      end

    end

  end
end
