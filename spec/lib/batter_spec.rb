require 'spec_helper'

module FantasyBaseball

  describe Batter do

    let(:row) { {'playerID' => 'aardsda01', 'yearID' => 2011, 'league' => 'AL', 'teamID' => 'LAA', 'G' => 142,
                 'AB' => 502, 'R' => 54, 'H' => 127, '2B' => 30, '3B' => 1, 'HR' => 8, 'RBI' => 60,
                 'SB' => 21, 'CS' => 5 } }

    let(:data) { Statistics.initialize_key_names row }

    describe "a new batter class" do
      it "should be a type of Batter" do
        @batter = Batter.new(player_id: data.player_id)
        expect(@batter).to be_a_kind_of(Batter)
      end
    end

    describe ".initialize" do
      it "must have a valid player_id" do
        expect{ Batter.new nil }.to raise_error
      end
    end

    describe "batter class" do
      it "should be a kind of batter" do
        batter = Batter.new(player_id: 'aardsda01')
        expect(batter).to be_kind_of(Batter)
      end

      it "should have a player id" do
        batter = Batter.new(player_id: 'aardsda01')
        expect(batter.player_id).to eq('aardsda01')
      end

      it "should have a player id w double quotes" do
        batter = Batter.new(player_id: "aardsda01")
        expect(batter.player_id).to eq("aardsda01")
      end
    end

    describe "batter" do
      before(:each) do
        @batter = Batter.new(player_id: data.player_id)
      end
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

    describe "complete batter object" do
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

    pending describe  "#update_batting_data" do
      let(:row) { {'playerID' => 'aardsda01', 'yearID' => 2011, 'league' => 'AL', 'teamID' => 'LAA', 'G' => 142,
                   'AB' => 502, 'R' => 54, 'H' => 127, '2B' => 30, '3B' => 1, 'HR' => 8, 'RBI' => 60,
                   'SB' => 21, 'CS' => 5 } }
      let(:data) { Batter.initialize_key_names row }

      before(:each) do
        @batter = Batter.new(player_id: 'aardsda01')
      end

      it "should update batting data" do

        puts "@batter BEFORE => #{@batter.inspect}"

        @batter.update_batting_data data
        #        expect(@batter.runs).to eq(350)

        #puts "@batter AFTER => #{@batter.inspect}"

      end
    end

  end

end
