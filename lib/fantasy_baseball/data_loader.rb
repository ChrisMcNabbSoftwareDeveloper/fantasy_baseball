require 'csv'

module FantasyBaseball

  class DataLoader

    def initialize(file_name)
      @file_path = File.expand_path(file_name, File.dirname(__FILE__))
    end

    # data_row => #<CSV::Row "playerID":"perkigl01" "yearID":"2007" "teamID":"MIN" "G":"19" "AB":nil "R":nil "H":nil "2B":nil "3B":nil "HR":nil "RBI":nil "SB":nil "CS":nil>
    # data_row => #<CSV::Row "playerID":"perryja01" "yearID":"2008" "teamID":"ATL" "G":"4" "AB":"17" "R":"0" "H":"2" "2B":"0" "3B":"1" "HR":"0" "RBI":"1" "SB":"0" "CS":"0">

    #    def load_batter_data
    #      players = {}
    #      CSV.foreach(@file_path, headers: true) do |data_row|
    #        data = Batter.load_from_csv data_row
    #        update_player_data(players, data)
    #      end
    #    end

    def load_batter_data
      batters = {}
      CSV.foreach(@file_path, headers: true) do |data_row|
        data = Batter.load_from_csv data_row
        update_batter_data(batters, data)
      end
    end

    private

    #    def update_player_data(players, data)
    #      players[data.player_id] = Player.new(player_id: data.player_id) unless players[data.player_id]
    #      player = players[data.player_id]
    #      player.update_batting_data data
    #    end

    private

    def update_batter_data(batters, data)
      batters[data.player_id] = Batter.new(player_id: data.player_id) unless batters[data.player_id]
      batter = batters[data.player_id]
      batter.update_batting_data data
    end

  end

end
