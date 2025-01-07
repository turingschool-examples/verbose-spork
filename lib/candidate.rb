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

# This refactor - follows the single-responsibility principle.
# initializes /name/party/votes, and has a method to increment votes.
# diana.votes will return total votes for diana 
# 
##candidate.name
#candidate.class
#candidate.party
#
#
