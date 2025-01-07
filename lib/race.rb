# frozen_string_literal: true

require_relative 'candidate'

# Create a race for the candidates to run in
class Race
  attr_reader :office, :candidates

  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate(candidate_details)
    (@candidates << Candidate.new(candidate_details)).last
  end
end
