require_relative 'fantasy_baseball/player'

module FantasyBaseball

  def self.exec
    batters = Batter.load
    welcome
    most_improved_batting_average(batters)
    oakland_slugging_percentage(batters)
    most_improved_players(*args)
    triple_crown_winner(*args)
  end

  def self.welcome
    puts "Fantasy Baseball - Play Ball! Statistics Report"
    puts "*" * 80
    puts "*" * 80
  end

  def self.most_improved_batting_average(*args)
    puts "Most Improved Batting Average"
    puts "- (players must have at least 200 at-bats.)"
    puts "-" * 80
    puts "DATA: "
    puts "-" * 80
  end

  def self.oakland_slugging_percentage(*args)
    puts "Oakland A's Slugging Percentage in 2007"
    puts "-" * 80
    puts "DATA: "
    puts "-" * 80
  end

  def self.most_improved_players(*args)
    puts "Top 5 Most Improved Players from 2011 to 2012"
    puts " - (players must have at least 500 at-bats.)"
    puts "-" * 80
    puts "DATA: "
    puts "-" * 80
  end

  def self.triple_crown_winner(*args)
    puts "Triple Crown Winner in 2011 and 2012"
    puts "-" * 80
    puts "DATA: "
    puts "-" * 80
    puts "*" * 80
  end





end