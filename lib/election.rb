class Election
  def initialize(year)
    @year = year 
    @races = []
  end

  def year
    @year  
  end

  def races
    @races
  end

  def add_race(race)
    @races << race
  end

  def candidates
    all_candidates = []
    @races.each do |race|
      race.candidates.each do |candidate|
        all_candidates << candidate
      end
    end
    all_candidates
  end

  def vote_counts
    counts = {}
    candidates.each do |candidate|
      counts[candidate.name] = candidate.vote_for
    end
    counts
  end
end