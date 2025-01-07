require './lib/candidate'

class Race
  attr_reader :office, :candidates

  def initialize(office) #just add office during initialization
    @office = office
    @candidates = [] #empty array to store candidates
    @open = true
  end

  def register_candidate(details)
    candidate = Candidate.new(details)
    @candidates << candidate #shovels candidates into the array #race.candidates will return all candidates
    candidate
  end

  def open? 
    @open
  end

  def close! 
    @open = false
  end

  def winner
    return false if open?

    max_votes = @candidates.map(&:votes).max
    @candidates.find { |candidate| candidate.votes == max_votes }
    #max_votes between candidates 
    #.map(&:votes) returns an array of votes
    #.max returns the highest number of votes
    #.find returns the candidate with the highest number of votes 
    #{ |candidate| candidate.votes == max_votes } will iterate through the array and return the candidate with the highest number of votes
  end

  def tie?
    return false if open?

    max_votes = @candidates.map(&:votes).max
    @candidates.count { |candidate| candidate.votes == max_votes } > 1
    #for a tie, there must be more than one candidate with the highest number of votes
    #will print out true if there is a tie
  end
end

# refactor ensures ace class is simple - follows the single-responsibility principle.
# It manages candidates, checks if the race is open, closes the race, determines the winner, and checks for ties.
