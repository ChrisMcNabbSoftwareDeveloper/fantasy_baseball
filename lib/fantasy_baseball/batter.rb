require 'csv'
require_relative 'player'

module FantasyBaseball

  class Batter < Player
    attr_accessor :player_id, :year_id, :league, :team_id, :games, :at_bats, :runs, :hits,
      :doubles, :triples, :home_runs, :runs_batted_in, :stolen_bases,
      :caught_stealing, :player, :batting_data, :batter_data_by_year

    def initialize(player_id)
      raise ArgumentError.new unless player_id
      super(player_id)
#      @batter_data_by_year = BatterDataByYear.new
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
