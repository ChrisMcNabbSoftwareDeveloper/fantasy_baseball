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

    describe "#annual_batting_average" do
      let(:player_id) {'aardsda01'}
      let(:data_row) { {'playerID' => player_id, 'yearID' => 2009,
                        'teamID' => 'NYA', 'G' => 152, 'AB' => 563, 'R' => 96,
                        'H' => 150, '2B' => 29, '3B' => 3, 'HR' => 15, 'RBI' => 103,
                        'SB' => 30, 'CS' => 8 } }

      it "should compute and return the annual batting average" do
        batting_statistics = Statistics.new
        annual_batting_average = batting_statistics.annual_batting_average(data_row)
        expect(annual_batting_average).to eq(0.2664298401420959)
      end
    end

    describe "#batting_average_improvement" do
      let(:player_id) {'abreubo01'}
      let(:base_row) { {'playerID' => player_id, 'yearID' => 2009,
                        'teamID' => 'LAA', 'G' => 152, 'AB' => 563, 'R' => 96,
                        'H' => 165, '2B' => 29, '3B' => 3, 'HR' => 15, 'RBI' => 103,
                        'SB' => 30, 'CS' => 8 } }
      let(:compare_row) { {'playerID' => player_id, 'yearID' => 2010,
                           'teamID' => 'LAA', 'G' => 154, 'AB' => 563, 'R' => 88,
                           'H' => 165, '2B' => 41, '3B' => 1, 'HR' => 20, 'RBI' => 78,
                           'SB' => 24, 'CS' => 10 } }

      it "should return '0' if batting average stayed the same between the two years" do
        batting_statistics = Statistics.new
        batting_average_improvement = batting_statistics.batting_average_improvement(base_row, compare_row)
        expect(batting_average_improvement).to eq(0)
      end
    end

    describe "#batting_average_improvement" do
      let(:player_id) {'abreubo01'}
      let(:base_row) { {'playerID' => player_id, 'yearID' => 2009,
                        'teamID' => 'LAA', 'G' => 152, 'AB' => 563, 'R' => 96,
                        'H' => 165, '2B' => 29, '3B' => 3, 'HR' => 15, 'RBI' => 103,
                        'SB' => 30, 'CS' => 8 } }
      let(:compare_row) { {'playerID' => player_id, 'yearID' => 2010,
                           'teamID' => 'LAA', 'G' => 154, 'AB' => 573, 'R' => 88,
                           'H' => 195, '2B' => 41, '3B' => 1, 'HR' => 20, 'RBI' => 78,
                           'SB' => 24, 'CS' => 10 } }

      it "should return the improvement value if batting average improved over the two years" do
        batting_statistics = Statistics.new
        batting_average_improvement = batting_statistics.batting_average_improvement(base_row, compare_row)
        expect(batting_average_improvement).to eq(0.3403141361256545)
      end
    end

    describe "#batting_average_improvement" do
      let(:player_id) {'abreubo01'}
      let(:base_row) { {'playerID' => player_id, 'yearID' => 2009,
                        'teamID' => 'LAA', 'G' => 152, 'AB' => 573, 'R' => 96,
                        'H' => 195, '2B' => 29, '3B' => 3, 'HR' => 15, 'RBI' => 103,
                        'SB' => 30, 'CS' => 8 } }
      let(:compare_row) { {'playerID' => player_id, 'yearID' => 2010,
                           'teamID' => 'LAA', 'G' => 154, 'AB' => 553, 'R' => 88,
                           'H' => 135, '2B' => 41, '3B' => 1, 'HR' => 20, 'RBI' => 78,
                           'SB' => 24, 'CS' => 10 } }

      it "should return '-1' if batting average did NOT improve over the two years" do
        batting_statistics = Statistics.new
        batting_average_improvement = batting_statistics.batting_average_improvement(base_row, compare_row)
        expect(batting_average_improvement).to eq(-1)
      end
    end

  end

end
