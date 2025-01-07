require './lib/race'

class Election
  attr_reader :year, :races

  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race) 
    @races << race #shovels race to the array p/vp
  end

  def candidates
    @races.flat_map(&:candidates) #flat_map will return an array of all candidates
  end

  def vote_counts
    candidates.each_with_object({}) do |candidate, counts|
      counts[candidate.name] = candidate.votes
      #code above will return a hash with the candidate name as the key and the number of votes as the value
    end
  end

  def winners
    @races.map { |race| race.winner unless race.open? || race.tie? }.compact
    #code above will return the winner of each race unless its still open or there is a tie
    #.compact will remove nil values from the array
  end
end

# refactor ensures that Election class is simple - follows the single-responsibility principle.
# It manages races, lists candidates, counts votes, and determines the winners of each race.
