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

     describe  "#update_batting_data" do
       before(:each) do
        @player = Player.new(player_id: 'aardsda01')
       end

# @batter AFTER => #<FantasyBaseball::Batter:0x007f971405f048 @year_id=nil, @team_id=nil, @at_bats=nil, @hits=nil, @doubles=nil, @triples=nil, @home_runs=nil, @runs_batted_in=nil, @stolen_bases=nil, @caught_stealing=nil, @player_id="aardsda01", @batting_data={"2011"=>#<FantasyBaseball::Batter:0x007f9714828680 @year_id=2011, @team_id="LAA", @at_bats=502, @hits=127, @doubles=30, @triples=1, @home_runs=8, @runs_batted_in=60, @stolen_bases=21, @caught_stealing=5, @player_id="aardsda01", @batting_data={}, @player=#<FantasyBaseball::Batter:0x007f971405f048 ...>>}>
# @team_id="LAA", @at_bats=502

       it "should update batting data" do
puts "@player BEFORE => #{@player.inspect}"
        @player.update_batting_data data
puts "@player.class => #{@player.class}"

#        expect(@batting_data{"team_id"}).to eq("LAA")
puts "@player AFTER => #{@player.inspect}"
       end
     end

  end
end
