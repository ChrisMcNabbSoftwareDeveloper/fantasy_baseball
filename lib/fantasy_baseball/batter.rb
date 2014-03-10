require 'csv'
require_relative 'player'
require_relative '../../lib/fantasy_baseball/batter_data_by_year'

module FantasyBaseball

  class Batter < Player
    attr_accessor :player_id, :player_full_name, :batter_data_by_year

    def initialize(args, roster)
      raise ArgumentError.new unless args
      super(args, roster)
      @batter_data_by_year = BatterDataByYear.new(args)
    end

  end
end
