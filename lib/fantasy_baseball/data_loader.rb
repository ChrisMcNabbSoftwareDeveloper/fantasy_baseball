require 'csv'
require 'syslog'
require 'configuration'
require_relative '../../lib/fantasy_baseball/statistics'
require_relative 'roster_entry'
require_relative 'batter_data_by_year'

module FantasyBaseball

  class DataLoader

    BATTING_PRE_PROCESSED_FILE_PATH = File.expand_path('data/Batting-pre-processed.csv')
    PLAYER_ROSTER_PRE_PROCESSED_FILE_PATH = File.expand_path('data/Master-pre-processed.csv')

    def initialize
    end

    def load_player_roster(file_path)
      return ArgumentError if file_path.empty?
      @file_path = clean_input_file(file_path, PLAYER_ROSTER_PRE_PROCESSED_FILE_PATH)
      @csv_options = build_options_hash(Configuration.for 'csv_options')
      @roster = []
      @players_by_id = {}
      @line_count = 0
      begin
        CSV.foreach(@file_path, @csv_options) do |row|
          @line_count += 1
          roster_data = Statistics.initialize_roster_data row
          next unless roster_data_clean?(roster_data)
          find_or_create_roster_entry(roster_data)
        end
        log_successful_import(@file_path, @line_count)
      rescue CSV::MalformedCSVError => error
        log_failed_import(@file_path, error)
        raise
      end
      @roster
    end

    def load_batting_data(file_path, roster)
      return ArgumentError if file_path.empty?
      @file_path = clean_input_file(file_path, BATTING_PRE_PROCESSED_FILE_PATH)
      @csv_options = build_options_hash(Configuration.for 'csv_options')
      @batters = []
      @batters_by_id = {}
      @line_count = 0
      begin
        CSV.foreach(@file_path, @csv_options) do |row|
          @line_count += 1
          batter_data = Statistics.initialize_batting_data row
          next unless batting_data_clean?(batter_data)
          find_or_create_batter(batter_data, roster)
#          batter.batter_data_by_year << transform_data(batter_data)

        end
        log_successful_import(@file_path, @line_count)
      rescue CSV::MalformedCSVError => error
        log_failed_import(@file_path, error)
        raise
      rescue => error
        log_failed_import(@file_path, error)
        raise
      end
      @batters
    end

    #    private

    def build_options_hash(options)
      raise ArgumentError 'options cannot be nil' if options.nil?
       hash = {}
       hash[:headers] = options.headers
       hash[:col_sep] = options.col_sep
       hash[:row_sep] = options.row_sep
       hash[:quote_char] = options.quote_char
       hash[:field_size_limit] = options.field_size_limit
       hash[:converters] = options.converters
       hash[:unconverted_fields] = options.unconverted_fields
       hash[:headers] = options.headers
       hash[:return_headers] = options.return_headers
       hash[:write_headers] = options.write_headers
       hash[:skip_blanks] = options.skip_blanks
       hash[:force_quotes] = options.force_quotes
       hash[:encoding] = options.encoding
       hash
    end

    def find_or_create_roster_entry(data)
      if @players_by_id[data.player_id]
        @players_by_id[data.player_id]
      else
        temp_roster = RosterEntry.new(data)
        @players_by_id[data.player_id] = temp_roster
        @roster << temp_roster
      end
    end

    def find_or_create_batter(data,roster)
      if @batters_by_id[data.player_id]
        @batters_by_id[data.player_id]
      else
        temp_batter = Batter.new(data, roster)
        @batters_by_id[data.player_id] = temp_batter
        @batters << temp_batter
        temp_batter
      end
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
      hash[:batting_average] = compute_batting_average(batter_data.hits, batter_data.at_bats)
      hash
    end

    def compute_batting_average(hits, at_bats)
      if hits == 0 || at_bats == 0
        0
      else
       Float("%.3g" % ((hits * 1.0) / at_bats))
      end
    end

    def clean_input_file(file_path, pre_processed_file_path)
      command = "tr '\\n' '\\r' < #{file_path} > #{pre_processed_file_path}"
      system(command)
      pre_processed_file_path
    end

#    def update_batter_data(batters, data)
#      batters[data.player_id] = Batter.new(player_id: data.player_id) unless batters[data.player_id]
#      batter = batters[data.player_id]
#      batter.update_batting_data(data)
#    end

    def roster_data_clean?(data)
      valid_string?(data.player_id) &&
        valid_string?(data.player_birth_year) &&
        valid_string?(data.player_first_name) &&
        valid_string?(data.player_last_name)
    end

    def batting_data_clean?(data)
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

    def log_successful_import(file_path, line_count)
      Syslog.open('FantasyBaseball', Syslog::LOG_PID, Syslog::LOG_LOCAL5)
      Syslog.log(Syslog::LOG_INFO, "Successful File Import => file_path = #{file_path}, line_count = #{line_count}")
      Syslog.close()
    end

    def log_failed_import(file_path, exception)
      Syslog.open('FantasyBaseball', Syslog::LOG_PID, Syslog::LOG_LOCAL5)
      Syslog.log(Syslog::LOG_ERR, "File Import Failed => file_path = #{file_path} Exception Message: #{exception.inspect}")
      Syslog.close()
    end
  end

end
