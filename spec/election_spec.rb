require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  before(:each) do
    @election = Election.new("2024")
    @race1 = Race.new("Governor")
    @race2 = Race.new("Senator")
    @candidate1 = Candidate.new(name: "Diana D", party: :democrat)
    @candidate2 = Candidate.new(name: "Roberto R", party: :republican)
    @race1.add_candidate(@candidate1)
    @race2.add_candidate(@candidate2)
    @election.add_race(@race1)
    @election.add_race(@race2)
  end

  

end