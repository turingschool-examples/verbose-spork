class Election
  attr_reader :year, :races, :candidates

  def initialize(year)
    @year = year
    @races = []
    @candidates = []
  end

  def add_race(race)
    @races << race
    race.candidates.each {|candidate| @candidates.push(candidate)}
  end

  def vote_counts
    vote_counts = {}
    self.candidates.each do |candidate|
      vote_counts[candidate.name] = candidate.votes
    end
    return vote_counts
  end
end
