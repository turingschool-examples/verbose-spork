class Race
  attr_reader :office, :candidates

  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate!(details)
    candidate = Candidate.new(details) 
    @candidates << candidate
    candidate
  end
end
