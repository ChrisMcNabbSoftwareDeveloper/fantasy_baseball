module FantasyBaseball

  class Player
    attr_accessor :player_id, :player_full_name

    def initialize(args={}, roster)
      return ArgumentError unless args
      @player_id = args.player_id
      @player_full_name = get_player_full_name(args, roster)
    end

    private

    def get_player_full_name(args, roster)
      player_id_to_find = args.player_id
      roster.each do |r|
        if r.player_id == player_id_to_find
          return ( r.player_first_name + " " + r.player_last_name )
        else
          "no full name"
        end
      end
    end

  end

end
