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

  end

end
