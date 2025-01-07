class Race
    attr_reader :office, :candidates

    def initialize(office)
        @office = office
        @candidates = []
        @open = true
    end

    def register_candidate(candidate_details)
        candidate = Candidate.new(candidate_details)
        @candidates << candidate
        candidate
    end

    def open?
        @open
    end

    def close!
        @open = false
    end

    def winner
        return false if open?
        highest_votes = @candidates.map { |candidate| candidate.votes }.max 
        winners = @candidates.select { |candidate| candidate.votes == highest_votes }
        winners.sample.name
    end
end
