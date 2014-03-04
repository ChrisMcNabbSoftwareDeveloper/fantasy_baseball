module FantasyBaseball

  class Player
    attr_accessor :player_id

    def initialize(args={})
      @player_id = args[:player_id]
      @batting_data = {}
    end


  end

end
