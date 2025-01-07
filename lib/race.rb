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

    #Refactor to one line...
  end

  def open?()
    @is_open
  end

  def close!()
    @is_open = false
  end

  def winner()
    #Return false if race open; if race closed, return any candidate with the highest vote total
    #NOTE: will only return ONE candidate with highest votes (i.e. will not find ALL candidates if there is a tie)
    return false if @is_open

    #Probably use max enumerable here... (and remember <=> weirdness).  Maybe just use max_by?
    @candidates.max do |candidate1, candidate2|
      candidate1.votes <=> candidate2.votes
    end
  end

  def tie?()
    #Use max enumerable to find multiple highest votes candidates:
    candidates_list = @candidates.max(2) do |candidate1, candidate2|
      candidate1.votes <=> candidate2.votes
    end

    #There is a tie if the top two elements returned have identical votes
    return candidates_list[0].votes == candidates_list[1].votes

    # max_votes = 0
    # max_votes_candidate = nil
    # @candidates.each do |candidate|
    #   if candidate.votes >
  end

end
