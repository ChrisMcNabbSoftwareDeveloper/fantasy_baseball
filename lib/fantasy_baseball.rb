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
    batters = load_batters(load_player_roster)
    most_improved_batting_average(batters, "2009", "2010")
    oakland_slugging_percentage(batters, "2007")
    triple_crown_winner(batters, "2011", "2012")
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
    raise ArgumentError, "Batter Argument is nil. Please provide valid batter argument.", caller if args[0].nil?

#    most_improved_player = Statistics.most_improved_batting_average(*args)

    puts "*" * 80
    puts "Most Improved Batting Average"
    puts "-----------------------------"
    puts "(players must have at least 200 at-bats.)"
#    puts "   #{most_improved_player.first_name} #{most_improved_player.last_name} (#{most_improved_player.player_id})"
    puts "   Hank Aaron (aaronha01)" # <= example
  end

  def self.oakland_slugging_percentage(*args)
    raise ArgumentError, "Batter Argument is nil. Please provide valid batter argument.", caller if args[0].nil?

#    use for output dislay below
#    batters = args[:batters]
#    year_id = args[:year_id]
#    team_id = args[:team_id]

#    oakland_slugging_percentage = Statistics.slugging_percentage(batters, year, team_id)

    puts "*" * 80
    puts "Oakland A's Slugging Percentage in 2007"
    puts "---------------------------------------"
    puts "   42% "
  end

  def self.triple_crown_winner(*args)
    raise ArgumentError, "Batter Argument is nil. Please provide valid batter argument.", caller if args[0].nil?

#    use for output display below
#    batters = args[0] if args[0]
#    first_year = args[1] if args[1]
#    second_year = args[2] if args[2]

#    triple_crown_winner = Statistics.triple_crown_winner(args)

    puts "*" * 80
    puts "Triple Crown Winner for AL and NL in 2011 and 2012"
    puts "--------------------------------------------------"
    puts "2011:"
    puts "AL:   Johnny Abrego (abregojo01) "
    puts "NL:   Johnny Abrego (abregojo01) "
    puts "2012:"
    puts "AL:   Johnny Abrego (abregojo01) "
    puts "NL:   Johnny Abrego (abregojo01) "
    puts "*" * 80
  end

end
