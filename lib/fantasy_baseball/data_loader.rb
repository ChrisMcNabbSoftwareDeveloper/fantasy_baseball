require 'csv'

module FantasyBaseball

  class DataLoader

    def initialize(file_name)
      @file_path = File.expand_path(file_name, File.dirname(__FILE__))
    end

    def load_batter_data
      players = {}
      CSV.foreach(@file_path, headers: true) do |data_row|
        data = Batter.load_from_csv data_row
#puts "data => #{data.inspect}"
        update_player_data(players, data)
      end
    end

    def update_player_data(players, data)
      players[data.player_id] = Player.new data.player_id
      player = players[data.player_id]

puts '-' * 120
puts "player => #{player.inspect}"
puts '-' * 120

    end

  end
end
