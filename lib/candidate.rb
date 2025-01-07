class Candidate
    attr_reader :name, :party

    def initialize(info_hash)
        @name = info_hash[:name]
        @party = info_hash[:party]
    end
end
