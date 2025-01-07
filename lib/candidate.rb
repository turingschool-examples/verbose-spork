class Candidate
  attr_reader :name, :party, :votes

  def initialize(candidate_data)
    @name = candidate_data[:name]
    @party = candidate_data[:party]
    @votes = 0
  end

  def vote_for
    @votes += 1
  end
end
