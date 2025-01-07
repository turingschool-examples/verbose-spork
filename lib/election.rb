class Election
  attr_reader :year, :races

  def initialize(year)
    @year = year

    @races = []
    # @candidates = []      #Might not do this.  Just use method to find it each time...(otherwise tight coupling happens)
    # @vote_counts = {}       #Key is candidate name, value is vote_count for that candidate

  end

  def add_race(race)
    @races << race
  end

  def candidates()
    #Determine all candidates by looking through each race
    @races.map do |race|
      race.candidates
    end.flatten             #Needed because each race.candidates is an array (so full array is nested)

    #Alt: do a nested iteration setup (probably the more 'classic' way)
  end

  def vote_counts()
    votes_hash = {}

    #Could create hash of just keys from candidates()...
    #Darn, hash.keys = candidate_names_array won't work...

    #Can I do this via map?  (Refactor maybe)

    candidates().each do |candidate|
      votes_hash[candidate.name] = candidate.votes
    end

    return votes_hash



    # @races.each do |race|
    #   votes_hash[candidate_name] ||= or += 1
    #   votes_hash[candidate_name] = 0
    # end

    #Probably a quicker enumerable...I almost feel like I know it...
  end

end
