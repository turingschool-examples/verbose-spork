class Race
  attr_reader :office, :candidates

  def initialize(office)
    @office = office

    @candidates = []
  end

  def register_candidate(input_hash)
    new_candidate = Candidate.new(input_hash)
    @candidates << new_candidate

    return new_candidate

    #Refactor to one line...
  end

end
