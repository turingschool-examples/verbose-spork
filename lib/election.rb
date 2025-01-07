require 'pry'

class Election
    attr_reader :year,
                :races,
                :candidates

    def initialize(year)
        @year = year
        @races = []
        @candidates = []
    end

    def add_race(race)
        @races << race
    end

    def candidates
        @candidates = @races.flat_map { |race| race.candidates }
    end

    def vote_counts
            counts = {}
            @candidates.each do |candidate|
            counts[candidate.name] = candidate.votes
        end
        counts
    end
end