class Race
    attr_reader :office, :candidates, :open

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

    # def close!

    # end

    # def winner

    # end

    # def tie?

    # end
end
