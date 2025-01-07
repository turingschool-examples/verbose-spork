require 'pry'
class Race
    attr_reader :race_position,
                :office,
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
end
