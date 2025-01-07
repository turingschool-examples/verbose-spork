class Candidate
  attr_reader :name, :party, :votes

  def initialize(details)
    @name = details[:name]
    @party = details[:party]
    @votes = 0
  end

  def vote_for
    @votes += 1
  end
end

# This refactor ensures that the Candidate class is simple and follows the single-responsibility principle.
# It initializes with a name, party, and votes, and has a method to increment votes.
