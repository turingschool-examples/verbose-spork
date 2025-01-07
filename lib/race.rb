class Race
    attr_reader :office, :candidates

    def initialize(office)
        @office = office
        @candidates = []
        @open = true
    end

    def register_candidate(info)
        candidate = Candidate.new(info)
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
        return false if @open

        winners = @candidates.find_all { |candidate| candidate.votes == @candidates.max_by(&:votes).votes }

        return winners[0] if winners.size == 1
        return winners
    end
end
