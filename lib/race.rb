class Race
  attr_reader :office, :candidates

  def initialize(office)
    @office = office

    @candidates = []
    @is_open = true
  end

  def register_candidate(input_hash)
    new_candidate = Candidate.new(input_hash)
    @candidates << new_candidate

    return new_candidate
    #Note: cannot refactor to one line like this, since it returns the array and not the new candidate: @candidates << Candidate.new(input_hash)
  end

  def open?()
    @is_open
  end

  def close!()
    @is_open = false
  end

  def winner()
    #NOTE: will only return ONE candidate with highest votes (i.e. will not find ALL candidates if there is a tie)
    return false if @is_open

    #Needs <=> for proper numerical comparison.  Maybe just use max_by in the future?
    @candidates.max do |candidate1, candidate2|
      candidate1.votes <=> candidate2.votes
    end
  end

  def tie?()
    #Use max enumerable to find top two highest votes candidates:
    candidates_list = @candidates.max(2) do |candidate1, candidate2|
      candidate1.votes <=> candidate2.votes
    end

    #There is at least a two-way tie if the top two elements returned happen to have identical votes
    return candidates_list[0].votes == candidates_list[1].votes
  end

end
