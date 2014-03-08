require_relative 'fantasy_baseball/batter'
require_relative '../lib/fantasy_baseball/data_loader'
require_relative '../config/configuration'

module FantasyBaseball

  batting_config = Configuration.for 'batting_input_file'
  @batting_file_path = File.expand_path(batting_config.file_name)

  # future expansion
  pitching_config = Configuration.for 'pitching_input_file'
  @pitching_file_path = File.expand_path(pitching_config.file_name)

  def self.exec
    welcome
    batters = load_batters
    most_improved_batting_average(batters, "2009", "2010")
#    oakland_slugging_percentage(batters, "2007")
#    triple_crown_winner(batters, "2011", "2012")
  end

  def self.load_batters
    batters = DataLoader.new(@batting_file_path)
    batters.load_batter_data
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

#    most_improved_player = calculate_most_improved_batting_average(*args)

    puts "*" * 80
    puts "Most Improved Batting Average"
    puts "-----------------------------"
    puts "(players must have at least 200 at-bats.)"
#    puts "   #{most_improved_player.first_name} #{most_improved_player.last_name} (#{most_improved_player.player_id})"
    puts "   Hank Aaron (aaronha01)" # <= example - delete
  end

  def self.oakland_slugging_percentage(*args)
    raise ArgumentError, "Batter Argument is nil. Please provide valid batter argument.", caller if args[0].nil?

    batters = args[0] if args[0]
    year = args[1] if args[1]

    puts "*" * 80
    puts "Oakland A's Slugging Percentage in 2007"
    puts "---------------------------------------"
    puts "   42% "
  end

  def self.triple_crown_winner(*args)
    raise ArgumentError, "Batter Argument is nil. Please provide valid batter argument.", caller if args[0].nil?

    batters = args[0] if args[0]
    first_year = args[1] if args[1]
    second_year = args[2] if args[2]

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
