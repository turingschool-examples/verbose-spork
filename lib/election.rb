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
    @races.map(&:candidates).flatten
  end

  def vote_counts
    counts = {}
    candidates.each do |candidate|
      counts[candidate.name] = candidate.votes
    end
    counts
  end

  def winners
    winners = []
    @races.each do |race|
      winners << race.winner unless race.open? || race.tie?
    end
    winners
  end
end
