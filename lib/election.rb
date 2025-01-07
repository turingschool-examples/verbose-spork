require './lib/candidate'
require './lib/race'
require 'pry'
class Election
        attr_accessor :year, :races, :candidates
    def initialize
        @year = nil
        @races = []
    end

    def new(year)
        @year = year
    end

    def add_race(office)
        race = Race.new(office)
        @races << race
        race
    end

    def candidates
        @races.flat_map(&:candidates)
    end

    def vote_counts
        @races.flat_map(&:candidates).each_with_object({}) do |candidate, total|
            total[candidate.name] = candidate.votes
        end
    end
end
