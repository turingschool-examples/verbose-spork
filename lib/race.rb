class Race
    attr_reader :position_in_office, :candidates

    def initialize(position_in_office)
        @position_in_office = position_in_office
        @candidates = []
    end

    def register_candidate(candidate_info)
        candidate = Candidate.new(candidate_info)
        @candidates << candidate
        candidate
    end
end
