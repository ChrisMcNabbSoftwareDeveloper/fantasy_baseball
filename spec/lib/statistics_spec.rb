require 'spec_helper'
require_relative '../../lib/fantasy_baseball/statistics'

module FantasyBaseball

  describe Statistics do

    describe "statistics" do
      it "should be a kind of statistics" do
        batting_statistics = Statistics.new
        expect(batting_statistics).to be_a_kind_of(Statistics)
      end
    end

    describe "#initialize_roster_data" do

      let(:row) { {'playerID' => 'aaronha01', 'birthYear' => 2011, 'nameFirst' => 'Hank', 'nameLast' => 'Aaron' } }
      let(:data) { Statistics.initialize_roster_data row }

      it "initializes roster data" do
        expect(data.player_id).to eq(row['playerID'])
        expect(data.player_birth_year).to eq(row['birthYear'])
        expect(data.player_first_name).to eq(row['nameFirst'])
        expect(data.player_last_name).to eq(row['nameLast'])
      end
    end

    describe "#initialize_batting_data" do

      let(:row) { {'playerID' => 'aardsda01', 'yearID' => 2011, 'league' => 'AL', 'teamID' => 'LAA', 'G' => 142,
                   'AB' => 502, 'R' => 54, 'H' => 127, '2B' => 30, '3B' => 1, 'HR' => 8, 'RBI' => 60,
                   'SB' => 21, 'CS' => 5 } }
      let(:data) { Statistics.initialize_batting_data row }

      it "initializes batting data" do
        expect(data.player_id).to eq(row['playerID'])
        expect(data.year_id).to eq(row['yearID'])
        expect(data.league).to eq(row['league'])
        expect(data.team_id).to eq(row['teamID'])
        expect(data.games).to eq(row['G'])
        expect(data.at_bats).to eq(row['AB'])
        expect(data.runs).to eq(row['R'])
        expect(data.hits).to eq(row['H'])
        expect(data.doubles).to eq(row['2B'])
        expect(data.triples).to eq(row['3B'])
        expect(data.home_runs).to eq(row['HR'])
        expect(data.runs_batted_in).to eq(row['RBI'])
        expect(data.stolen_bases).to eq(row['SB'])
        expect(data.caught_stealing).to eq(row['CS'])
      end
    end

    describe "#most_improved_batting_average" do
      before(:all) do
        file_path = File.expand_path('data/Master-small.csv')
        data_loader = DataLoader.new
        @roster = data_loader.load_player_roster(file_path)
        batting_file_path = File.expand_path('data/Batting-07-12.csv')
        data_loader = DataLoader.new
        @batters = data_loader.load_batting_data(File.expand_path(batting_file_path), @roster)
        @options = {:base_year => "2009", :compare_year => "2010", :limit_at_bats => 200}
      end

      it "should return most improved batting average" do
        batting_stats = Statistics.new
        most_improved = batting_stats.most_improved_batting_average(@batters, @options)
        puts "most_improved => #{most_improved}"
        expect(most_improved[:player_id]).to eq("hamiljo03")
      end
    end

    describe "#slugging_percentage" do
      before(:all) do
        file_path = File.expand_path('data/Master-small.csv')
        data_loader = DataLoader.new
        @roster = data_loader.load_player_roster(file_path)
        batting_file_path = File.expand_path('data/Batting-07-12.csv')
        data_loader = DataLoader.new
        @batters = data_loader.load_batting_data(File.expand_path(batting_file_path), @roster)
        @options = { :team_id => "OAK", :year_id => "2007"}
      end

      it "should return most improved batting average" do
        batting_stats = Statistics.new
        slugging_percentage = batting_stats.slugging_percentage(@batters, @options)
        puts "slugging_percentage => #{slugging_percentage}"
        expect(slugging_percentage).to eq(40.70288685673301)
      end
    end

  end

end
