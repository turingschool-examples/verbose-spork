require './lib/candidate'

class Race
  attr_reader :office, :candidates

  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate(details) #accepts a hash of details from candidate class
    candidate = Candidate.new(details)
    @candidates << candidate #will shovel in the new candidate into the candidates array
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
    @candidates.select { |candidate| candidate.votes == max_votes }.first
  end

  def tie?
    return false if open?

    max_votes = @candidates.map(&:votes).max
    @candidates.count { |candidate| candidate.votes == max_votes } > 1
  end
end
