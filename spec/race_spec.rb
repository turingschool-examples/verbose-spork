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
    #Need a new race here to have empty array since @candidate_1 and 2 are already registered in before(:each)
    race_2 = Race.new("California State Auditor")

    expect(race_2.office).to eq("California State Auditor")
    expect(race_2.candidates).to eq([])
  end

  it 'can register candidates, with correct object type etc.' do
    expect(@candidate_1).to be_a(Candidate)
    expect(@candidate_1.name).to eq("Diana D")
    expect(@candidate_1.party).to eq(:democrat)

    expect(@candidate_2).to be_a(Candidate)
    expect(@candidate_2.name).to eq("Roberto R")
    expect(@candidate_2.party).to eq(:republican)

    expect(@race.candidates).to eq([@candidate_1, @candidate_2])
  end

  it 'race begins open, and can be closed' do
    expect(@race.open?()).to eq(true)

    @race.close!()

    expect(@race.open?()).to eq(false)
  end

  it 'determine winner of a race properly, including no winner if race is still open' do
    candidate_3 = @race.register_candidate({name: "Sabine Hossenfelder", party: :independent})
    
    @candidate_1.vote_for
    @candidate_1.vote_for
    @candidate_2.vote_for
    @candidate_2.vote_for
    @candidate_2.vote_for
    candidate_3.vote_for
    candidate_3.vote_for
    
    expect(@race.winner()).to eq(false)

    @race.close!()

    expect(@race.winner()).to eq(@candidate_2)

    #Check if it updates correctly e.g. for a recount after polls are closed:
    candidate_3.vote_for
    candidate_3.vote_for

    expect(@race.winner()).to eq(candidate_3)
  end

  it 'determines if a tie has occurred' do
    @candidate_1.vote_for
    @candidate_1.vote_for
    @candidate_2.vote_for
    @candidate_2.vote_for
    @candidate_2.vote_for

    expect(@race.tie?()).to eq(false)

    @candidate_1.vote_for

    expect(@race.tie?()).to eq(true)
  end

end
