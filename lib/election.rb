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
end
