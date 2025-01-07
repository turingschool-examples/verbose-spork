require './lib/candidate'

class Race
  attr_reader :office, :candidates

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
    return false if open?

    max_votes = @candidates.map(&:votes).max
    @candidates.find { |candidate| candidate.votes == max_votes }
  end

  def tie?
    return false if open?

    max_votes = @candidates.map(&:votes).max
    @candidates.count { |candidate| candidate.votes == max_votes } > 1
  end
end

# This refactor ensures that the Race class is simple and follows the single-responsibility principle.
# It manages candidates, checks if the race is open, closes the race, determines the winner, and checks for ties.
