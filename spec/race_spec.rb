require './lib/candidate'
require './lib/race'

RSpec.describe Race do
  before(:each) do
    @race = Race.new("Texas Governor")
  end

  it "exists" do
    expect(@race).to be_an_instance_of(Race)

  end

  it "has office and candidate attributes" do
    expect(@race.office).to eq("Texas Governor")
    expect(@race.candidates).to eq([])
  end

  it "can register a candidate and returns instance of Candidate" do
    candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
    expect(candidate1.class).to eq(Candidate)  
    expect(candidate1.name).to eq("Diana D")
    expect(candidate1.party).to eq(:democrat)

    candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
    expect(candidate2.class).to eq(Candidate)
    expect(candidate2.name).to eq("Roberto R")
    expect(candidate2.party).to eq(:republican)
  end

  it "displays candidates in the candidates array" do
    candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})

    expect(@race.candidates).to eq([candidate1, candidate2]) 
  end

end