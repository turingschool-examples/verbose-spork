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
    #Return false if race open; if race closed, return array of candidate(s) with highest vote total(s)
    return false if @is_open

    #Probably use max enumerable here... (and remember <=> weirdness)
    @candidates.max(1) do |candidate|
      candidate.votes
    end

    #PROBLEM: max(n) will return n highest values, even if they're not all tied.  Crap...might have to make my own enumerable...
  end

end
