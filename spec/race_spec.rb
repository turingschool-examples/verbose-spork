require './lib/candidate.rb'
require './lib/race.rb'

RSpec.describe Race do
  before(:each) do
    @race = Race.new("Texas Governor")
    @candidate_1 = @race.register_candidate({name: "Diana D", party: :democrat})
    @candidate_2 = @race.register_candidate({name: "Roberto R", party: :republican})
  end

  it 'exists' do
    expect(@race).to be_a(Race)
  end

  it 'can initialize correctly' do
    expect(@race.office).to eq("Texas Governor")
    expect(@race.candidates).to eq([])    #Fix this - already registered above
  end

  it 'can register candidates, with correct object type etc.' do
    expect(@candidate_1).to be_a(Candidate)   #Equivalent to checking its class via '.class'
    expect(@candidate_1.name).to eq("Diana D")
    expect(@candidate_1.party).to eq(:democrat)

    expect(@candidate_2).to be_a(Candidate)
    expect(@candidate_2.name).to eq("Roberto R")
    expect(@candidate_2.party).to eq(:republican)

    expect(@race.candidates). to eq([@candidate_1, @candidate_2])
  end





end
