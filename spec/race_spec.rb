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

  it 'race begins open, and can be closed' do
    expect(@race.open?()).to eq(true)

    @race.close!()

    expect(@race.open?()).to eq(false)
  end

  it 'determine winner of a race properly, including no winner if race is still open' do
    #Probably add a third candidate here for thoroughness...
    
    @candidate_1.vote_for
    @candidate_1.vote_for
    @candidate_2.vote_for
    @candidate_2.vote_for
    @candidate_2.vote_for
    
    expect(@race.winner()).to eq(false)

    @race.close!()

    expect(@race.winner()).to eq([@candidate_2])

    #Check it works correctly for a tie:
    @candidate_1.vote_for

    expect(@race.winner()).to eq([@candidate_1, @candidate_2])
  end

end
