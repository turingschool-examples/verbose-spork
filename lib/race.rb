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
end
