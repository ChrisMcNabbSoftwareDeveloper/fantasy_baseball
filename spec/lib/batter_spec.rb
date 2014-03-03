require 'spec_helper'

module FantasyBaseball

  describe Batter do

# abreubo01,2011,LAA,142,502,54,127,30,1,8,60,21,5
    let(:row) { {'playerID' => 'aardsda01', 'yearID' => 2011, 'teamID' => 'LAA', 'G' => '142',
                 'AB' => 502, 'R' => 54, 'H' => 127, '2B' => 30, '3B' => 1, 'HR' => 8, 'RBI' => 60,
                 'SB' => 21, 'CS' => 5 } }

    let(:data) { Batter.load_from_csv row }

    describe "#load_from_csv" do

      it "initializes statistic values" do
        expect(data.player_id).to eq(row['playerID'])
      end
    end


    pending it "loads batters from the input data file" do
      path_to_file = File.expand_path("../data/Batting-07-12.csv", File.dirname(__FILE__))

      batters = FantasyBaseball::Batter.load
    end

  end

end
