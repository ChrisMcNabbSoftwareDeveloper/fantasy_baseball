module FantasyBaseball

  class Player
    attr_accessor :player_id

    def initialize(args={})
      @player_id = args[:player_id]
    end

  end

end
