

class Election
  attr_reader :year,
              :races,
              :candidates,
              :votes_count,
              :open,
              :tie,
              :winners
  
  def initialize(year)
    @year = year
    @races = []
    @candidates = []
    @votes_count = {}
    @winners = []
    @open = true
    @tie = false
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

  def tie?
    @tie
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def winner
    return false if @open
    winner = @candidates.sort_by {|x| -x.votes}
    if winner[0].votes == winner[1].votes
      @tie = true
      return 'Tie'
    else 
      @winners << winner[0]
      return winner[0]
    end
  end
end
