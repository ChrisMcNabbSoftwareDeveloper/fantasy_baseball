require 'csv'
require_relative 'player'

module FantasyBaseball

  class Batter < Player
    attr_accessor :year_id, :team_id, :at_bats, :hits,
      :doubles, :triples, :home_runs, :runs_batted_in, :stolen_bases, :caught_stealing, :player

    def initialize
      super
    end

    def self.load_from_csv(row)
      puts "row #{row.inspect}"
      data = Batter.new
      data.player_id = row['playerID']
      data.year_id = row['yearID']
      data.team_id = row['teamID']
      data.at_bats = row['AB'].to_i
      data.hits = row['H'].to_i
      data.doubles = row['2B'].to_i
      data.triples = row['3B'].to_i
      data.home_runs = row['HR'].to_i
      data.runs_batted_in = row['RBI'].to_i
      data.stolen_bases = row['SB'].to_i
      data.caught_stealing = row['CS'].to_i
      data
    end

  end
end
