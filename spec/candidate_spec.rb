require './lib/candidate'

RSpec.describe Candidate do
  before(:each) do
    @diana = Candidate.new({name: "Diana D", party: :democrat})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@diana).to be_a Candidate
    end

    it 'has a name' do
      expect(@diana.name).to eq("Diana D")
    end

    it 'has a party' do
      expect(@diana.party).to eq(:democrat)
    end
  end

  describe '#votes' do
    it 'defaults to 0' do
      expect(@diana.votes).to eq(0)
    end

    it 'tracks that candidate recieved a vote' do
      @diana.vote_for

      expect(@diana.votes).to eq(1)
    end

    it 'tracks that candidate recieved multiple votes' do
      @diana.vote_for
      @diana.vote_for
      @diana.vote_for
      
      expect(@diana.votes).to eq(3)
    end
  end
end



