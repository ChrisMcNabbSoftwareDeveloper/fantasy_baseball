module FantasyBaseball

  class Player
    attr_accessor :player_id, :player_birth_year, :player_first_name, :player_last_name

    def initialize(args={})
      @player_id = args[:player_id]
    end

    def self.initialize_key_names(row)
      data = Player.new(player_id: row['playerID'])
      data.player_id = row['playerID']
      data.player_birth_year = row['birthYear']
      data.player_first_name = row['nameFirst']
      data.player_last_name = row['nameLast']
      data
    end


#    def valid_name?(first_name, last_name)
#      valid_string?(first_name) && valid_string?(last_name)
#    end
#
#    def valid_string?(string)
#      !(string.nil? || string.empty?)
#    end
#
#    def get_player_full_name(first_name, last_name)
#      if valid_name?(first_name, last_name)
#        first_name + " " + last_name
#      else
#        ""
#      end
#    end

  end

end
