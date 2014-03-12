require 'spec_helper'

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

    describe "new batter" do

      # 5 rows of data, for same player - 'abreubo01', 1 row for each year from 2007 - 2012 
      # (with extra year of data for 2012 for other league)
      # # so in this case, batter_1 is the same batter, but contains different data for each year

      let(:row1) { {'playerID' => 'aaronha01', 'birthYear' => 1934, 'nameFirst' => 'Hank', 'nameLast' => 'Aaron' } }
      let(:data1) { Statistics.initialize_roster_data row1 }
      let(:roster_entry_1) { FantasyBaseball::RosterEntry.new data1 }

      let(:row2) { {'playerID' => 'bernavi01', 'birthYear' => 1953, 'nameFirst' => 'Victor', 'nameLast' => 'Bernal' } }
      let(:data2) { Statistics.initialize_roster_data row2 }
      let(:roster_entry_2) { FantasyBaseball::RosterEntry.new data2 }

      let(:row3) { {'playerID' => 'abreub01', 'birthYear' => 1974, 'nameFirst' => 'Bobby', 'nameLast' => 'Abreu' } }
      let(:data3) { Statistics.initialize_roster_data row3 }
      let(:roster_entry_3) { FantasyBaseball::RosterEntry.new data3 }

      let(:row4) { {'playerID' => 'bernacu01', 'birthYear' => 1952, 'nameFirst' => 'Curt', 'nameLast' => 'Bernard' } }
      let(:data4) { Statistics.initialize_roster_data row4 }
      let(:roster_entry_4) { FantasyBaseball::RosterEntry.new data4 }

      let(:row5) {  {'playerID' => 'berroge01', 'birthYear' => 1965, 'nameFirst' => 'Geronimo', 'nameLast' => 'Berroa' } }
      let(:data5) { Statistics.initialize_roster_data row5 }
      let(:roster_entry_5) { FantasyBaseball::RosterEntry.new data5 }

      let(:roster) { [roster_entry_1, roster_entry_2, roster_entry_3, roster_entry_4, roster_entry_5 ] }


      let(:row_1) { {'playerID' => 'abreubo01', 'yearID' => 2012, 'league' => 'AL', 'teamID' => 'LAA',
                     'G' => 8, 'AB' => 24, 'R' => 1, 'H' => 5, '2B' => 3, '3B' => 0, 'HR' => 0, 'RBI' => 5, 'SB' => 0, 'CS' => 0 } }
      let(:data_1) { Statistics.initialize_batting_data row_1 }
      let(:batter_1) { Batter.new(data_1, roster, BatterDataByYear.new(data_1)) }

      let(:row_2) { {'playerID' => 'abreubo01', 'yearID' => 2012, 'league' => 'NL', 'teamID' => 'LAN',
                     'G' => 92, 'AB' => 195, 'R' => 28, 'H' => 48, '2B' => 8, '3B' => 1, 'HR' => 3, 'RBI' => 19, 'SB' => 6, 'CS' => 2 } }
      let(:data_2) { Statistics.initialize_batting_data row_2 }
      let(:batter_2) { Batter.new(data_2, roster, BatterDataByYear.new(data_2)) }

      let(:row_3) { {'playerID' => 'abreubo01', 'yearID' => 2011, 'league' => 'AL', 'teamID' => 'LAA',
                     'G' => 142, 'AB' => 502, 'R' => 54, 'H' => 127, '2B' => 30, '3B' => 1, 'HR' => 8, 'RBI' => 50, 'SB' => 21, 'CS' => 5 } }
      let(:data_3) { Statistics.initialize_batting_data row_3 }
      let(:batter_3) { Batter.new(data_3, roster, BatterDataByYear.new(data_3)) }

      let(:row_4) { {'playerID' => 'abreubo01', 'yearID' => 2012, 'league' => 'NL', 'teamID' => 'LAA',
                     'G' => 154, 'AB' => 573, 'R' => 88, 'H' => 146, '2B' => 41, '3B' => 1, 'HR' => 20, 'RBI' => 78, 'SB' => 24, 'CS' => 10 } }
      let(:data_4) { Statistics.initialize_batting_data row_4 }
      let(:batter_4) { Batter.new(data_4, roster, BatterDataByYear.new(data_4)) }

      let(:row_5) { {'playerID' => 'abreubo01', 'yearID' => 2009, 'league' => 'AL', 'teamID' => 'LAA',
                     'G' => 152, 'AB' => 563, 'R' => 96, 'H' => 165, '2B' => 29, '3B' => 3, 'HR' => 15, 'RBI' => 103, 'SB' => 30, 'CS' => 8 } }
      let(:data_5) { Statistics.initialize_batting_data row_5 }
      let(:batter_5) { Batter.new(data_5, roster, BatterDataByYear.new(data_5)) }

      let(:row_6) { {'playerID' => 'abreubo01', 'yearID' => 2008, 'league' => 'AL', 'teamID' => 'NYA',
                     'G' => 156, 'AB' => 609, 'R' => 100, 'H' => 180, '2B' => 39, '3B' => 4, 'HR' => 20, 'RBI' => 100, 'SB' => 22, 'CS' => 11 } }
      let(:data_6) { Statistics.initialize_batting_data row_6 }
      let(:batter_6) { Batter.new(data_6, roster, BatterDataByYear.new(data_6)) }

      let(:row_7) { {'playerID' => 'abreubo01', 'yearID' => 2007, 'league' => 'AL', 'teamID' => 'NYA',
                     'G' => 158, 'AB' => 605, 'R' => 123, 'H' => 171, '2B' => 40, '3B' => 5, 'HR' => 16, 'RBI' => 101, 'SB' => 25, 'CS' => 8 } }
      let(:data_7) { Statistics.initialize_batting_data row_7 }
      let(:batter_7) { Batter.new(data_7, roster, BatterDataByYear.new(data_7)) }


      before(:each) do
        @batters = Batter.new(batter_1, roster, BatterDataByYear.new(batter_1))
        @batters = Batter.new(batter_2, roster, BatterDataByYear.new(batter_2))
      end
      it "should have a valid player id" do
        expect(@batter.player_id).to eq('aaronha01')
      end

    end

  end
end
