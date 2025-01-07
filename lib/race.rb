require 'pry'
class Race
    attr_reader :office,
                :candidates

    def initialize(office, open_ = true)
        @office = office
        @candidates = []
        @open = open_
    end

    def register_candidate(candidate_details)
        candidate = Candidate.new(candidate_details)
        @candidates << candidate
        candidate
    end

    def open?
        @open = open
    end

    def close!
        @open = false
    end

    # def winner
    #     if @open = false 
    #         return @election.vote_counts.values.max
    #     else @open = true
    #         return false
    #     end
    # end
end
