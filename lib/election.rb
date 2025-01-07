class Election
  attr_reader :year, :races, :candidates

  def initialize(year)
    @year = year
    @races = []
    @candidates = []
    @winners = []
  end

  def add_race(race)
    @races << race
    race.candidates.each {|candidate| @candidates << candidate}
  end

  def vote_counts
    vote_counts = {}
    @candidates.each do |candidate|
      vote_counts[candidate.name] = candidate.votes
    end
    return vote_counts
  end

  def winners
    @races.each do |race|
      if (race.winner)
        @winners << race.winner
      end
    end

    return @winners
  end
end
