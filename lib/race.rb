class Race
    attr_reader :office, :candidates, :open, :winner

    def initialize(office, open = true)
        @office = office
        @candidates = []
        @open = open
    end

    def register_candidate(candidate_details)
        new_candidate = Candidate.new(candidate_details)

        @candidates << new_candidate

        new_candidate
    end

    def open?
        @open
    end

    def close!
        @open = false
        winner
    end

    def winner
        if open == false
            most_voted = nil
            highest_votes = 0
            @candidates.each do |candidate|
                if candidate.votes > highest_votes
                    most_voted = candidate
                    highest_votes = candidate.votes
                    @tie = false
                elsif candidate.votes == highest_votes
                    most_voted = nil
                    @tie = true
                end
            end
            @winner = most_voted
        else
            @winner = false
            @tie = false
        end
        @winner
    end

    def tie?
        @tie
    end
end
