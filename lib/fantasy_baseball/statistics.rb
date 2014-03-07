module FantasyBaseball

  class Statistics

    def initialize
    end

    def annual_batting_average(data)
      hits = data["H"] if data["H"]
      at_bats = data["AB"] if data["AB"]
      (hits * 1.0) / at_bats
    end

    def batting_average_improvement(base_row, compare_row)
      base_row_batting_average = annual_batting_average(base_row)
      compare_row_batting_average = annual_batting_average(compare_row)

      delta = base_row_batting_average <=> compare_row_batting_average

# i know this is not very intuitive....i'll circle back around and refactor... it's working atm
      case delta
      when 0
        0 #same - no change - no improvement
      when 1
        -1 # <= NO, there was no improvement
      when -1
        compare_row_batting_average # <= YES there was improvement
      end

    end

  end

end
