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

  describe '#open?' do
    it 'can check if a race is open' do
      expect(@race.open?).to eq(true)
    end
  end

  describe '#close!' do
    it 'can close a race' do
      @race.close!
      expect(@race.open?).to eq(false)
    end
  end

  describe '#winner' do
    it 'can display the winner of a race' do
      @race.register_candidate(@diana)
      @race.register_candidate(@roberto)
      3.times {@diana.vote_for}
      2.times {@roberto.vote_for}
      @race.close!
      expect(@race.winner).to eq(@diana)
    end

    it 'will not display a winner for an open race' do
      @race.register_candidate(@diana)
      @race.register_candidate(@roberto)
      3.times {@diana.vote_for}
      2.times {@roberto.vote_for}
      expect(@race.winner).to eq(false)
    end

    it 'will decide a winner in case of a tie' do
      winners = []
      @race.register_candidate(@diana)
      @race.register_candidate(@roberto)
      3.times {@diana.vote_for}
      3.times {@roberto.vote_for}
      @race.close!
      winners << @race.winner
      expect(winners.size).to eq(1)
    end
  end

  describe '#tie?' do
    it 'can check whether there was a tie' do
      @race.register_candidate(@diana)
      @race.register_candidate(@roberto)
      3.times {@diana.vote_for}
      3.times {@roberto.vote_for}
      @race.close!
      expect(@race.tie?).to eq(true)
    end
  end

end