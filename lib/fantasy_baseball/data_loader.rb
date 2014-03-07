require 'csv'

module FantasyBaseball

  class DataLoader

    def initialize(file_path)
      @file_path = clean_input_file(file_path)
    end

    def load_batter_data
      batters = {}
      begin
        CSV.foreach(@file_path, headers: true) do |data_row|
          data = Batter.load_from_csv data_row
          update_batter_data(batters, data) if data_clean?(data)
        end
      rescue CSV::MalformedCSVError
        # log this MalformedCSVError
       false
      end
      true
    end

    private

    def clean_input_file(file_path)
      # this code here is a little "hokey"...but it works for the moment....will refactor
      pre_processed_file_path = File.expand_path('data/Batting-pre-processed.csv')
      command = "tr '\\n' '\\r' < #{file_path} > #{pre_processed_file_path}"
      system(command)
      pre_processed_file_path
    end

    def update_batter_data(batters, data)
      batters[data.player_id] = Batter.new(player_id: data.player_id) unless batters[data.player_id]
      batter = batters[data.player_id]
      batter.update_batting_data(data)
    end

    def data_clean?(data)
      valid_string?(data.player_id) &&
      valid_string?(data.year_id) &&
      valid_string?(data.league) &&
      valid_string?(data.team_id) &&
      valid_integer?(data.games) &&
      valid_integer?(data.at_bats) &&
      valid_integer?(data.runs) &&
      valid_integer?(data.hits) &&
      valid_integer?(data.doubles) &&
      valid_integer?(data.triples) &&
      valid_integer?(data.home_runs) &&
      valid_integer?(data.runs_batted_in) &&
      valid_integer?(data.stolen_bases) &&
      valid_integer?(data.caught_stealing)

    end

    def valid_string?(string)
      !(string.nil? || string.empty?)
    end

    def valid_integer?(value)
      value.is_a? Integer
    end
  end

end
