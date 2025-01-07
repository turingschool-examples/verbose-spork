class Race
  attr_reader :office, :candidates

  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate(candidate)
    @candidates << candidate
    return candidate
  end

  def open?
    return @open
  end

  def close!
    @open = false
  end

  def winner
    if open?
      return false
    else
      return @candidates.max_by {|candidate| candidate.votes}
    end
  end

  def tie?
    max_votes = @candidates.map{|candidate| candidate.votes}.max
    return true if max_votes[0] == max_votes[1]
    return false
  end
end
