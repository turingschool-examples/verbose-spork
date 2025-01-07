class Race
    attr_reader :office, :candidates

    def initialize(office)
        @office = office
        @candidates = []
    end

    def register_candidate(info)
        Candidate.new(info)
    end
end
