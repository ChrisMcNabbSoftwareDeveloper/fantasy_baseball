require 'spec_helper'

module FantasyBaseball

  describe RosterEntry do

    describe "new roster entry" do
      let(:row) { { 'playerID' => 'aaronha01', 'birthYear' => '1934', 'nameFirst' => 'Hank', 'nameLast' => 'Aaron' } }
      let(:data) { Player.initialize_key_names row}
      before(:each) do
        @roster_entry = RosterEntry.new(data)
      end

      it "should be a type of RosterEntry" do
        expect(@roster_entry).to be_a_kind_of(RosterEntry)
      end
      it "should set the player_id" do
        expect(@roster_entry.player_id).to eq('aaronha01')
      end
      it "should set the player_first_name" do
        expect(@roster_entry.player_first_name).to eq('Hank')
      end
      it "should set the player_last_name" do
        expect(@roster_entry.player_last_name).to eq('Aaron')
      end
      it "should set the player_birth_year" do
        expect(@roster_entry.player_birth_year).to eq('1934')
      end
      it "should set the player_full_name" do
        expect(@roster_entry.player_full_name).to eq('Hank Aaron')
      end

    end



  end
end
