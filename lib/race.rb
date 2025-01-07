require './lib/candidate'

class Race

    attr_reader :office
    attr_accessor :candidates, :open
    def initialize(office)
        @office = office
        @candidates = []
        @open = true
    end

    def register_candidate(details)
        candidate = Candidate.new(details)
        @candidates << candidate
        candidate
    end

    def open?
        @open
    end

    def close!
        @open = false
    end

    def winner(false)
        if @open = false
            true
            @candidates.max_by{ |candidate| candidate[:votes]}
        end
    end
end
