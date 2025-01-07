

class Election
  attr_reader :year,
              :races,
              :candidates,
              :votes_count
  
  def initialize(year)
    @year = year
    @races = []
    @candidates = []
    @votes_count = {}
  end

  def add_race(race)
    @races << race
    race.candidates.each{|x| @candidates << x}
    race
  end

  def votes_count
    @candidates.each{|candidate| @votes_count[candidate.name] = candidate.votes}
    @votes_count
  end
end
