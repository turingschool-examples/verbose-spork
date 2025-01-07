class Candidate
  attr_reader :name, :party, :votes

  def initialize(details)
    @name = details[:name] #sets name to the name key in the details hash
    @party = details[:party] #sets party to the party key in the details hash
    @votes = 0
  end

  def vote_for
    @votes += 1 #adds one to candidate votes
  end
end
