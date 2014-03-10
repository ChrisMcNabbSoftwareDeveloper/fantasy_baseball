require 'spec_helper'
require_relative '../../lib/fantasy_baseball/batter'
require_relative '../../lib/fantasy_baseball/statistics'

module FantasyBaseball

  describe Batter do

    let(:row1) { {'playerID' => 'aaronha01', 'birthYear' => 1934, 'nameFirst' => 'Hank', 'nameLast' => 'Aaron' } }
    let(:data1) { Statistics.initialize_roster_data row1 }
    let(:roster_entry_1) { FantasyBaseball::RosterEntry.new data1 }

    let(:row2) { {'playerID' => 'bernavi01', 'birthYear' => 1953, 'nameFirst' => 'Victor', 'nameLast' => 'Bernal' } }
    let(:data2) { Statistics.initialize_roster_data row2 }
    let(:roster_entry_2) { FantasyBaseball::RosterEntry.new data2 }

    let(:row3) { {'playerID' => 'bernacu01', 'birthYear' => 1952, 'nameFirst' => 'Curt', 'nameLast' => 'Bernard' } }
    let(:data3) { Statistics.initialize_roster_data row3 }
    let(:roster_entry_3) { FantasyBaseball::RosterEntry.new data3 }

    let(:row4) { {'playerID' => 'bernacu01', 'birthYear' => 1952, 'nameFirst' => 'Curt', 'nameLast' => 'Bernard' } }
    let(:data4) { Statistics.initialize_roster_data row4 }
    let(:roster_entry_4) { FantasyBaseball::RosterEntry.new data4 }

    let(:row5) {  {'playerID' => 'berroge01', 'birthYear' => 1965, 'nameFirst' => 'Geronimo', 'nameLast' => 'Berroa' } }
    let(:data5) { Statistics.initialize_roster_data row5 }
    let(:roster_entry_5) { FantasyBaseball::RosterEntry.new data5 }

    let(:roster) { [roster_entry_1, roster_entry_2, roster_entry_3, roster_entry_4, roster_entry_5 ] }

    let(:row) { {'playerID' => 'aaronha01', 'yearID' => 2011, 'league' => 'AL', 'teamID' => 'LAA', 'G' => 142,
                 'AB' => 502, 'R' => 54, 'H' => 127, '2B' => 30, '3B' => 1, 'HR' => 8, 'RBI' => 60,
                 'SB' => 21, 'CS' => 5 } }
    let(:data) { Statistics.initialize_batting_data row }

    describe "a new batter class" do
      it "should be a type of Batter" do
        batter = Batter.new(data, roster)
        expect(batter).to be_a_kind_of(Batter)
      end
    end

    describe ".initialize" do
      it "should raise an error if there's no valid player_id" do
        expect{ Batter.new nil }.to raise_error
      end
    end

    describe "batter" do
      before(:each) do
        @batter = Batter.new(data, roster)
      end
      it "should have a valid player id" do
        expect(@batter.player_id).to eq('aaronha01')
      end
      it "should have a valid player_full_name" do
        expect(@batter.player_full_name).to eq('Hank Aaron')
      end
      it "should have a valid batter_data_by_year" do
        expect(@batter.batter_data_by_year.player_id).to eq(@player_id="aaronha01")
        expect(@batter.batter_data_by_year.year_id).to eq(@year_id=2011)
        expect(@batter.batter_data_by_year.league).to eq(@league="AL")
        expect(@batter.batter_data_by_year.team_id).to eq(@team_id="LAA")
        expect(@batter.batter_data_by_year.games).to eq(@games=142)
        expect(@batter.batter_data_by_year.at_bats).to eq(@at_bats=502)
        expect(@batter.batter_data_by_year.runs).to eq(@runs=54)
        expect(@batter.batter_data_by_year.hits).to eq(@hits=127)
        expect(@batter.batter_data_by_year.doubles).to eq(@doubles=30)
        expect(@batter.batter_data_by_year.triples).to eq(@triples=1)
        expect(@batter.batter_data_by_year.home_runs).to eq(@home_runs=8)
        expect(@batter.batter_data_by_year.runs_batted_in).to eq(@runs_batted_in=60)
        expect(@batter.batter_data_by_year.stolen_bases).to eq(@stolen_bases=21)
        expect(@batter.batter_data_by_year.caught_stealing).to eq(@caught_stealing=5)
        expect(@batter.batter_data_by_year.batting_average).to eq(@batting_average=0.253)
      end
    end

    pending    describe "foo" do
      it "should have a valid year_id" do
        @batter.year_id = data.year_id
        expect(@batter.year_id).to eq(2011)
      end
      it "should have a valid team_id" do
        @batter.team_id = data.team_id
        expect(@batter.team_id).to eq('LAA')
      end
      it "should have a valid league" do
        @batter.league = data.league
        expect(@batter.league).to eq('AL')
      end
      it "should have a valid games" do
        @batter.games = data.games
        expect(@batter.games).to eq(142)
      end
      it "should have a valid at_bats" do
        @batter.at_bats = data.at_bats
        expect(@batter.at_bats).to eq(502)
      end
      it "should have a valid runs" do
        @batter.runs = data.runs
        expect(@batter.runs).to eq(54)
      end
      it "should have a valid hits" do
        @batter.hits = data.hits
        expect(@batter.hits).to eq(127)
      end
      it "should have a valid doubles" do
        @batter.doubles = data.doubles
        expect(@batter.doubles).to eq(30)
      end
      it "should have a valid triples" do
        @batter.triples = data.triples
        expect(@batter.triples).to eq(1)
      end
      it "should have a valid home_runs" do
        @batter.home_runs = data.home_runs
        expect(@batter.home_runs).to eq(8)
      end
      it "should have a valid runs_batted_in" do
        @batter.runs_batted_in = data.runs_batted_in
        expect(@batter.runs_batted_in).to eq(60)
      end
      it "should have a valid stolen_bases" do
        @batter.stolen_bases = data.stolen_bases
        expect(@batter.stolen_bases).to eq(21)
      end
      it "should have a valid caught_stealing" do
        @batter.caught_stealing = data.caught_stealing
        expect(@batter.caught_stealing).to eq(5)
      end
    end

    pending    describe "complete batter object" do
      before(:each) do
        @batter = Batter.new(player_id: data.player_id)
        @batter.year_id = data.year_id
        @batter.league = data.league
        @batter.team_id = data.team_id
        @batter.games = data.games
        @batter.at_bats = data.at_bats
        @batter.runs = data.runs
        @batter.hits = data.hits
        @batter.doubles = data.doubles
        @batter.triples = data.triples
        @batter.home_runs = data.home_runs
        @batter.runs_batted_in = data.runs_batted_in
        @batter.stolen_bases = data.stolen_bases
        @batter.caught_stealing = data.caught_stealing
      end

      it "should have valid data for the whole object" do
        expect(@batter.year_id).to eq(2011)
        expect(@batter.league).to eq('AL')
        expect(@batter.team_id).to eq('LAA')
        expect(@batter.games).to eq(142)
        expect(@batter.at_bats).to eq(502)
        expect(@batter.runs).to eq(54)
        expect(@batter.hits).to eq(127)
        expect(@batter.doubles).to eq(30)
        expect(@batter.triples).to eq(1)
        expect(@batter.home_runs).to eq(8)
        expect(@batter.runs_batted_in).to eq(60)
        expect(@batter.stolen_bases).to eq(21)
        expect(@batter.caught_stealing).to eq(5)
      end
    end

  end

end
