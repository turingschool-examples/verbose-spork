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
        @races.map { |race| race.candidates }.flatten
    end

    def vote_counts
        counts = {}
        candidates.each do |candidate|
            counts[candidate.name] = candidate.votes
        end
        counts
    end
end
