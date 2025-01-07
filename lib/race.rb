class Race
  attr_reader :office, :candidates

  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate(candidate_data)
    @candidates << candidate_data
    return candidate_data
  end

end
