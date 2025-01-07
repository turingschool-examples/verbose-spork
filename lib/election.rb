require './lib/race'

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
    @races.flat_map(&:candidates)
  end

  def vote_counts
    candidates.each_with_object({}) do |candidate, counts|
      counts[candidate.name] = candidate.votes
    end
  end

  def winners
    @races.map { |race| race.winner unless race.open? || race.tie? }.compact
  end
end

# This refactor ensures that the Election class is simple and follows the single-responsibility principle.
# It manages races, lists candidates, counts votes, and determines the winners of each race.
