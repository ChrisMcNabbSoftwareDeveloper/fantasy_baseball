module FantasyBaseball

  class Statistics 
    attr_accessor :player_id, :year_id, :league, :team_id, :games, :at_bats, :runs, :hits,
      :doubles, :triples, :home_runs, :runs_batted_in, :stolen_bases,
      :caught_stealing, :batting_average, :player_birth_year, :player_first_name, :player_last_name,
      :player_full_name

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
      data.batting_average = nil
      data.player_full_name = nil
      data
    end

    #    def batting_average_improvement(base_year, compare_year)
    #      base_year_batting_average = annual_batting_average(base_year)
    #      compare_year_batting_average = annual_batting_average(compare_year)
    #      delta = base_year_batting_average <=> compare_year_batting_average
    #      case delta
    #      when 0
    #        0 #same - no change - no improvement
    #      when 1
    #        -1 # <= NO, there was no improvement
    #      when -1
    #        compare_year_batting_average # <= YES there was improvement
    #      end
    #    end

    def most_improved_batting_average(batters, args={})
      raise ArgumentError.new 'args cannot be nil' if args.nil?

      @base_year = args[:base_year]
      @compare_year = args[:compare_year]
      @limit_at_bats = args[:limit_at_bats]

      @line_count = 0
      @most_improved = {}
      batters.each do |key, value|
        @line_count += 1
        player_id = key
        data_by_year = value
        player_full_name = value[0].player_full_name

        puts '-' * 120
        puts "player_id(key) => #{player_id}"
        puts '-' * 120
        puts '-' * 120
        puts "data_by_year(value) => #{data_by_year.inspect}"
        puts '-' * 120

        base_year_data = data_by_year.detect { |data| next unless data.year_id == @base_year; if data.at_bats > @limit_at_bats; data; end }
        compare_year_data = data_by_year.detect { |data| next unless data.year_id == @compare_year; if data.at_bats > @limit_at_bats; data; end }

puts '-' * 120
puts "base_year_data => #{base_year_data.inspect}"
puts '-' * 120

puts '-' * 120
puts "compare_year_data => #{compare_year_data.inspect}"
puts '-' * 120

        batting_average_base_year = base_year_data.batting_average if !base_year_data.nil?
        batting_average_compare_year = compare_year_data.batting_average if !compare_year_data.nil?

puts '-' * 120
puts "batting_average_base_year => #{batting_average_base_year.inspect}"
puts '-' * 120

puts '-' * 120
puts "batting_average_compare_year => #{batting_average_compare_year.inspect}"
puts '-' * 120

        delta = batting_average_base_year <=> batting_average_compare_year

puts '-' * 120
puts "delta => #{delta.inspect}"
puts '-' * 120

        case delta
        when 0
          @delta_flag = 0.0 #same - no change - no improvement
        when 1
          @delta_flag = -1.0 # <= NO, there was no improvement
        when -1
          @delta_flag = (batting_average_compare_year * 1.0  - batting_average_base_year)  # <= YES there was improvement
        end

puts '-' * 120
puts "@delta_flag => #{@delta_flag.inspect}"
puts '-' * 120
puts '-' * 120
puts '>> BEFORE'
puts "@most_improved => #{@most_improved.inspect}"
puts '-' * 120

        if @delta_flag > 0.0 && @delta_flag < 1.0

puts '-' * 120
puts "@most_improved[:delta] => #{@most_improved[:delta].inspect}" if @most_improved[:delta]
puts '-' * 120
          if @most_improved.empty?
            @most_improved[:player_id] = player_id
            @most_improved[:player_full_name] = player_full_name
            @most_improved[:delta] = @delta_flag
          end
          if !@most_improved[:delta].nil? && (@most_improved[:delta] < @delta_flag)
            @most_improved[:player_id] = player_id
            @most_improved[:player_full_name] = player_full_name
            @most_improved[:delta] = @delta_flag

puts '-' * 120
puts '>>>>>>>>> @most_improved JUST UPDATED'
puts "@most_improved => #{@most_improved.inspect}"
puts '-' * 120

          end
        end

puts '-' * 120
puts "@most_improved => #{@most_improved.inspect}"
puts '-' * 120

      end
      @most_improved
    end

  end
end
