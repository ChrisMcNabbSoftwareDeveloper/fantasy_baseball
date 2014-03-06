require_relative '../../lib/fantasy_baseball/statistics'

module FantasyBaseball

  describe Statistics do

    describe "stastics" do 
      it "should be a kind of statistics" do
        batting_statistics = Statistics.new
        expect(batting_statistics).to be_a_kind_of(Statistics)
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
