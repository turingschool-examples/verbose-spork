class Election
  attr_reader :year, :races

  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
  end

  def candidates
    candidates = []
    @races.each do |race|
      @race.candidates.each do |candidate|
        candidates << candidate
      end
    end 
    return candidates
  end

  def vote_counts
    vote_counts = {}
    self.candidates.each do |candidate|
      vote_counts[candidate.name] = candidate.votes
    end
    return vote_counts
  end
end
