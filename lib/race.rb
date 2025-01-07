

class Race
  attr_reader :office,
              :candidates,
              :open,
              :tie
  
  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate(candidate_details)
    candidate = Candidate.new(candidate_details)
    @candidates << candidate
    candidate
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def tie?
    def tie?
      return false if @candidates.empty?
      max_votes = @candidates.max_by(&:votes).votes
      @candidates.count { |candidate| candidate.votes == max_votes } > 1
    end
  end

  def winner
    return false if open?
    return false if tie?
    @candidates.max_by(&:votes)
  end

end
