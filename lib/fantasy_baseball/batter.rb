require 'csv'
require_relative 'player'

module FantasyBaseball

  class Batter < Player
    attr_accessor :year_id, :league, :team_id, :games, :at_bats, :runs, :hits,
      :doubles, :triples, :home_runs, :runs_batted_in, :stolen_bases,
      :caught_stealing, :player, :batting_data, :batter_data_by_year

    def initialize(args)
      @year_id = args[:year_id]
      @league = args[:league]
      @team_id = args[:team_id]
      @games = args[:games]
      @at_bats = args[:at_bats]
      @runs = args[:runs]
      @hits = args[:hits]
      @doubles = args[:doubles]
      @triples = args[:triples]
      @home_runs = args[:home_runs]
      @runs_batted_in = args[:runs_batted_in]
      @stolen_bases = args[:stolen_bases]
      @caught_stealing = args[:caught_stealing]
      super(args)
      @batting_data = {}
      @batter_data_by_year = []
    end

    def self.initialize_key_names(row)
      data = Batter.new(player_id: row['playerID'])
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

    def update_batting_data(data)

puts "*" * 120
puts '-' * 120
puts "data => #{data.inspect}"
puts '-' * 120
#
puts '-' * 120
puts "@batting_data => #{@batting_data.inspect}"
puts '-' * 120
puts "*" * 120

      data.player = self

puts '-' * 120
puts "data.player => #{data.player.inspect}" if data.player
puts '-' * 120

      year = data.year_id.to_s

puts '-' * 120
puts "year => #{year.inspect}" if data.year_id
puts '-' * 120

puts "@batting_data[year] => #{@batting_data[year].inspect}"

      if @batting_data[year]
#puts "inside if"
        @batting_data[year].add_new_data data
      else
#puts "inside else"
        @batting_data[year] = data
      end

#      puts '-' * 120
#      puts "@batting_data => #{@batting_data.inspect}"
#      puts '-' * 120

    end

    def add_new_data(data)
      @games += data.games
      @at_bats += data.at_bats
      @runs += data.runs
      @hits += data.hits
      @doubles += data.doubles
      @triples += data.triples
      @home_runs += data.home_runs
      @runs_batted_in += data.runs_batted_in
      @stolen_bases += data.stolen_bases
      @caught_stealing += data.caught_stealing
    end


  end
end
