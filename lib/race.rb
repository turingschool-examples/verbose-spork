require 'pry'
class Race
    attr_reader :office,
                :candidates

    def initialize(office)
        @office = office
        @candidates = []
    end

    def register_candidate(candidate_details)
        candidate = Candidate.new(candidate_details)
        @candidates << candidate
        candidate
    end

    def open?
        @open = true
    end

    def close!
        @open = false
    end
end
