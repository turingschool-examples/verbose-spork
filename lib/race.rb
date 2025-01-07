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

    def winner
        if @open == false
            winner = @candidates.max_by(&:votes)
            p "Winner: #{winner.name} with #{winner.votes} votes!"
        else
            p "the race continues!"
        end
    end

#     def tie?
#         if @candidates.max_by(&:votes) > 1
#             p "it's a tie!"
#         else
#             winner
#         end
#     end
end
