class Candidate
    attr_reader :name, :party
    attr_accessor :votes

    def initialize(details)
        @name = details[:name]
        @party = details[:party]
        @votes = 0
    end

    def vote_for
        @votes += 1
    end
end
