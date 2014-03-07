require 'csv'

module FantasyBaseball

  class DataLoader

    def initialize(file_path)
      @file_path = clean_input_file(file_path)
    end

    def load_batter_data
      @batters = []
      @batters_by_id = {}

      begin
        CSV.foreach(@file_path, headers: true) do |row|
          batter_data = Batter.initialize_key_names row
          next unless data_clean?(batter_data)
          batter = find_or_create_batter(batter_data.player_id)
          batter.batter_data_by_year << transform_data(batter_data)
        end
      rescue CSV::MalformedCSVError
        # log this MalformedCSVError
        false
      end
      @batters
    end

#    private

    def find_or_create_batter(player_id)
      if @batters_by_id[player_id]
        @batters_by_id[player_id]
      else
        temp_batter = Batter.new(player_id)
        @batters_by_id[player_id] = temp_batter
        @batters << temp_batter
        temp_batter
      end
    end

    def transform_data(batter_data)
      hash = {}
      hash[:player_id] = batter_data.player_id
      hash[:player_full_name] = get_player_full_name(batter_data.player_id)
      hash[:batter_data_by_year] = get_data_by_year(batter_data)
    end

    def get_player_full_name(player_id)

    end

    def get_data_by_year(batter_data)
      hash = {}
      hash[:player_id] = batter_data.player_id
      hash[:year_id] = batter_data.year_id
      hash[:league] = batter_data.league
      hash[:team_id] = batter_data.team_id
      hash[:games] = batter_data.games
      hash[:at_bats] = batter_data.at_bats
      hash[:runs] = batter_data.runs
      hash[:hits] = batter_data.hits
      hash[:doubles] = batter_data.doubles
      hash[:triples] = batter_data.triples
      hash[:home_runs] = batter_data.home_runs
      hash[:runs_batted_in] = batter_data.runs_batted_in
      hash[:stolen_bases] = batter_data.stolen_bases
      hash[:caught_stealing] = batter_data.caught_stealing
      hash[:batting_average] = ( batter_data.hits * 1.0 ) / batter_data.at_bats
      hash
    end

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
