require './lib/candidate'
require './lib/race'
require 'rspec'

describe Race do
  before do
    @race = Race.new("Texas Governor")
    @diana = Candidate.new({name: "Diana D", party: :democrat})
    @roberto = Candidate.new({name: "Roberto R", party: :republican})
  end

  it 'exists' do
    expect(@race).to be_a(Race)
  end

  it 'has an office' do
    expect(@race.office).to eq("Texas Governor")
  end

  it 'has an array for tracking candidates' do
    expect(@race.candidates).to eq([])
  end

  it 'can register candidates' do
    @race.register_candidate(@diana)
    expect(@race.candidates).to eq([@diana])
  end

  it 'returns the data of a registered candidate' do
    candidate1 = @race.register_candidate(@diana)
    expect(candidate1).to eq(@diana)
    expect(candidate1.class).to eq(Candidate)
    expect(candidate1.name).to eq("Diana D")
    expect(candidate1.party).to eq(:democrat)
  end

  it 'can return a list of current candidates' do
    candidate1 = @race.register_candidate(@diana)
    candidate2 = @race.register_candidate(@roberto)
    expect(@race.candidates).to eq([candidate1, candidate2])
  end

end