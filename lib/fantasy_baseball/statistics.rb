module FantasyBaseball

  class Statistics
    attr_accessor :player_id, :year_id, :league, :team_id, :games, :at_bats, :runs, :hits,
      :doubles, :triples, :home_runs, :runs_batted_in, :stolen_bases,
      :caught_stealing, :player_birth_year, :player_first_name, :player_last_name
    #, :player, :batting_data, :batter_data_by_year

    def initialize
    end

    def self.initialize_roster_data(row)
      data = Statistics.new
      data.player_id = row['playerID']
      data.player_birth_year = row['birthYear']
      data.player_first_name = row['nameFirst']
      data.player_last_name = row['nameLast']
      data
    end

    def self.initialize_batting_data(row)
      data = Statistics.new
      data.player_id = row['playerID']
      data.year_id = row['yearID']
      data.league = row['league']
      data.team_id = row['teamID']
      data.games = row['G'].to_i
      data.at_bats = row['AB'].to_i
      data.runs = row['R'].to_i
      data.hits = row['H'].to_i
      data.doubles = row['2B'].to_i
      data.triples = row['3B'].to_i
      data.home_runs = row['HR'].to_i
      data.runs_batted_in = row['RBI'].to_i
      data.stolen_bases = row['SB'].to_i
      data.caught_stealing = row['CS'].to_i
     data
    end


    def annual_batting_average(data)
      hits = data["H"] if data["H"]
      at_bats = data["AB"] if data["AB"]
      (hits * 1.0) / at_bats
    end

    def batting_average_improvement(base_row, compare_row)
      base_row_batting_average = annual_batting_average(base_row)
      compare_row_batting_average = annual_batting_average(compare_row)

      delta = base_row_batting_average <=> compare_row_batting_average

# i know this is not very intuitive....i'll circle back around and refactor... it's working atm
      case delta
      when 0
        0 #same - no change - no improvement
      when 1
        -1 # <= NO, there was no improvement
      when -1
        compare_row_batting_average # <= YES there was improvement
      end

    end

  end

end
