module FantasyBaseball

  class BatterDataByYear

    attr_accessor :player_id, :year_id, :league, :team_id, :games, :at_bats, 
      :runs, :hits, :doubles, :triples, :home_runs, :runs_batted_in, :stolen_bases, 
      :caught_stealing, :batting_average

    def initialize(args)
#      return ArgumentError if args.nil?
      @player_id = args.player_id
      @year_id = args.year_id
      @league = args.league
      @team_id = args.team_id
      @games = args.games
      @at_bats = args.at_bats
      @runs = args.runs
      @hits = args.hits
      @doubles = args.doubles
      @triples = args.triples
      @home_runs = args.home_runs
      @runs_batted_in = args.runs_batted_in
      @stolen_bases = args.stolen_bases
      @caught_stealing = args.caught_stealing
      @batting_average = compute_batting_average(args.hits, args.at_bats)
    end

    private

    def compute_batting_average(hits, at_bats)
      if hits == 0 || at_bats == 0
        0
      else
        Float("%.3g" % ((hits * 1.0) / at_bats))
      end
    end

  end

end
