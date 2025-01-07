# frozen_string_literal: true

# Create a race for the candidates to run in
class Race
  attr_reader :office, :candidates

  def initialize(office)
    @office = office
    @candidates = []
  end
end
