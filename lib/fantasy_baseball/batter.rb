require 'csv'
require_relative 'player'

module FantasyBaseball

  class Batter < Player
    attr_accessor :player_id, :player_full_name, :batter_data_by_year

    def initialize(args, roster)
      raise ArgumentError.new 'args and roster cannot be nil' if (args.nil? || roster.nil?)
      super(args, roster)
      @batter_data_by_year = BatterDataByYear.new(args)
    end

  end
end
