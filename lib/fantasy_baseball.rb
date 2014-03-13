require_relative 'fantasy_baseball/batter'
require_relative '../lib/fantasy_baseball/data_loader'
require_relative '../config/configuration'

module FantasyBaseball

  roster_config = Configuration.for 'player_roster'
  @roster_file_path = File.expand_path(roster_config.input_file_name)
  batting_config = Configuration.for 'batting_input_file'
  @batting_file_path = File.expand_path(batting_config.input_file_name)

  # future expansion
  pitching_config = Configuration.for 'pitching_input_file'
  @pitching_file_path = File.expand_path(pitching_config.input_file_name)

  def self.exec
    welcome
    batters = (load_batters(load_player_roster))

    most_improved_batting_average(batters, {:base_year => "2009", :compare_year => "2010", :limit_at_bats => 200} )

    slugging_percentage(batters, {:team_id => "OAK", :year_id => "2007"} )

    triple_crown_header
    triple_crown_winner(batters, {:year => "2011", :league => "AL"} )
    triple_crown_winner(batters, {:year => "2011", :league => "NL"} )
    triple_crown_winner(batters, {:year => "2012", :league => "AL"} )
    triple_crown_winner(batters, {:year => "2012", :league => "NL"} )
  end

  def self.load_player_roster
    puts "status: loading player roster file..."
    data_loader = DataLoader.new
    data_loader.load_player_roster(@roster_file_path)
  end

  def self.load_batters(roster)
    puts "status: loading batting data file..."
    data_loader = DataLoader.new
    data_loader.load_batting_data(@batting_file_path, roster)
  end

  # future expansion - not implemented, yet
  def self.load_pitchers
    @pitchers = DataLoader.new(@pitching_file_path)
    @pitchers.load_pitcher_data
  end

  def self.welcome
    system("clear")
    puts "*" * 80
    puts "Fantasy Baseball - Play Ball! Statistics Report"
    puts "*" * 80
    puts " -- written by Chris McNabb, 2014"
    puts " -- The report values shown below reflect aggregated statistics"
    puts "    from the Batting-07-12.csv and the Master-small.csv data files."
    puts "*" * 80
  end

  def self.most_improved_batting_average(*args)
    raise ArgumentError, "args is nil. Please provide valid argument.", caller if args.nil?

    batting_stats = Statistics.new
    most_improved_player = batting_stats.most_improved_batting_average(*args)

    puts "*" * 80
    puts "Most Improved Batting Average"
    puts "-----------------------------"
    puts "(players must have at least #{args[1][:limit_at_bats].to_s} at-bats.)"
    puts "   #{most_improved_player[:player_full_name]} (#{most_improved_player[:player_id]})"
  end

  def self.slugging_percentage(batters, args)
    raise ArgumentError, "args is nil. Please provide valid argument.", caller if args.nil?

    batting_stats = Statistics.new
    slugging_percentage = batting_stats.slugging_percentage(batters, args)

    puts "*" * 80
    puts "#{args[:team_id]} Slugging Percentage in #{args[:year_id]}"
    puts "---------------------------------------"
    puts "   #{Float("%.3g" % slugging_percentage)}% "
  end

  def self.triple_crown_header
    puts "*" * 80
    puts "Triple Crown Winner(s)"
    puts "--------------------------------------------------"
  end

  def self.triple_crown_winner(batters, args)
    raise ArgumentError, "args is nil. Please provide valid argument.", caller if args.nil?

    triple_crown_winner = Statistics.triple_crown_winner(batters, args)

    puts "Year: #{args[:year]}"                 # "2011:"
    puts "League: #{args[:league]}"             # "AL:   Johnny Abrego (abregojo01) "
    puts "Player: #{triple_crown_winner}"
    puts "*" * 80

  end

end
