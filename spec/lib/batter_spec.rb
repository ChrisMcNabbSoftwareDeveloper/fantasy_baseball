require 'spec_helper'

module FantasyBaseball

  describe Batter do

    let(:row) { {'playerID' => 'aardsda01', 'yearID' => 2011, 'teamID' => 'LAA', 'G' => '142',
                 'AB' => 502, 'R' => 54, 'H' => 127, '2B' => 30, '3B' => 1, 'HR' => 8, 'RBI' => 60,
                 'SB' => 21, 'CS' => 5 } }

    let(:data) { Batter.load_from_csv row }

    describe "batter class" do
      it "should be a kind of batter" do
        batter = Batter.new(player_id: 'aardsda01')
        expect(batter).to be_kind_of(Batter)
      end

      it "should have a player id" do
        batter = Batter.new(player_id: 'aardsda01')
        expect(batter.player_id).to eq('aardsda01')
      end

      it "should have a year id" do
        batter = Batter.new(year_id: '2011')
        expect(batter.year_id).to eq('2011')
      end

      it "should have a team id" do
        batter = Batter.new(team_id: 'NYY')
        expect(batter.team_id).to eq('NYY')
      end

      #remaining tests truncated for brevity for sake of time
    end


    describe "#load_from_csv" do
      it "initializes data values" do
        puts "data.inspect => #{data.inspect}"
        expect(data.player_id).to eq(row['playerID'])
        expect(data.year_id).to eq(row['yearID'])
        expect(data.team_id).to eq(row['teamID'])
        expect(data.at_bats).to eq(row['AB'])
        expect(data.hits).to eq(row['H'])
        expect(data.doubles).to eq(row['2B'])
        expect(data.triples).to eq(row['3B'])
        expect(data.home_runs).to eq(row['HR'])
        expect(data.runs_batted_in).to eq(row['RBI'])
        expect(data.stolen_bases).to eq(row['SB'])
        expect(data.caught_stealing).to eq(row['CS'])
      end
    end


    pending it "loads batters from the input data file" do
      path_to_file = File.expand_path("../data/Batting-07-12.csv", File.dirname(__FILE__))

      batters = Batter.load_from_csv row
    end

  end

end
