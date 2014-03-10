require 'spec_helper'

module FantasyBaseball

  describe Player do

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

    describe "when we create a new player" do
      before(:each) do
        @player = Player.new(data, roster)
      end
      it "should be a kind of player" do
        expect(@player).to be_kind_of(Player)
      end
      it "should set the player_id " do
        expect(@player.player_id).to eq("aaronha01")
      end
      it "should set the player full name" do
        expect(@player.player_full_name).to eq("Hank Aaron")
      end
    end

  end
end
