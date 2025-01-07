class Election
  attr_reader :year, :races

  def initialize(year)
    @year = year

    @races = []
  end

  def add_race(race)
    @races << race
  end

  def candidates()
    @races.map do |race|
      race.candidates
    end.flatten             #Needed because each race.candidates is an array (so full array is nested)
  end

  def vote_counts()
    votes_hash = {}
    candidates().each do |candidate|
      votes_hash[candidate.name] = candidate.votes
    end

    return votes_hash
  end

  def winners()
    #The IC asks for an array, so this is implemented below.
    #Wouldn't a hash make more sense though to clearly map a race to a winning candidate (esp. since some will be empty so there is no 1:1 mapping apparent)?

    #Don't think .map enumerable will work here, since there is not a 1:1 correspondence in general
    winning_candidates = []
    @races.each do |race|
      winning_candidates << race.winner() if race.winner() && !race.tie?()
    end

    return winning_candidates
  end

end
