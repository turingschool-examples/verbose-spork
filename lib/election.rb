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
        all_candidates = []
        @races.each do |race|
            all_candidates += race.candidates
        end
        all_candidates
    end

    def vote_counts
    info = {}
        @races.each do |race|
            race.candidates.each do |candidate|
                info[candidate.name] = candidate.votes
            end
        end
        info
    end
end
