require 'spec_helper'

module FantasyBaseball

  describe Player do

    let(:row) { {'playerID' => 'aardsda01', 'yearID' => 2011, 'teamID' => 'LAA', 'G' => '142',
                 'AB' => 502, 'R' => 54, 'H' => 127, '2B' => 30, '3B' => 1, 'HR' => 8, 'RBI' => 60,
                 'SB' => 21, 'CS' => 5 } }
    let(:data) { Batter.load_from_csv row }

    describe "player" do
      it "should be a kind of player" do
        player = Player.new(player_id: "abcd123")
        expect(player).to be_kind_of(Player)
      end
    end

  end
end
