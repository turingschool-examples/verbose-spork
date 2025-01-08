# frozen_string_literal: true

# Create an election to hold races
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
    counts = {}
    candidates.each { |candidate| counts[candidate.name] = candidate.votes }
    counts
  end

  def winners
    @races.reject { |race| race.open? || race.tie? }.map(&:winner)
  end
end
