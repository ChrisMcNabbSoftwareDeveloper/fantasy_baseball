require 'csv'
require_relative 'player'
require_relative 'data_loader'

module FantasyBaseball

  class Batter < Player
    attr_accessor :year_id, :team_id, :at_bats, :hits, :doubles, :triples, :home_runs, :runs_batted_in, :stolen_bases, :caught_stealing

    def initialize(args)
      @year_id = args[:year_id]
      @team_id = args[:team_id]
      @at_bats = args[:at_bats]
      @hits = args[:hits]
      @doubles = args[:doubles]
      @triples = args[:triples]
      @home_runs = args[:home_runs]
      @runs_batted_in = args[:runs_batted_in]
      @stolen_bases = args[:stolen_bases]
      @caught_stealing = args[:caught_stealing]
      super(args)
    end

    def self.load_from_csv(row)
puts "row => #{row.inspect}"
      data = Batter.new(player_id: row['playerID'])
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

    #    def self.load(file_name)
    #      @batters = []
    #      @batters = DataLoader.new(file_name)
    #      @batters.load_batter_data
    #    end

  end
end
