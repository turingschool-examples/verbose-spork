class Candidate
    attr_reader :name, :party, :votes

    def initialize(info_hash)
        @name = info_hash[:name]
        @party = info_hash[:party]

        @votes = 0
    end
end
