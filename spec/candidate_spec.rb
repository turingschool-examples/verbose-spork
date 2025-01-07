require './spec/spec_helper.rb'

RSpec.describe Candidate do
  before(:each) do
    @diana = Candidate.new({name: "Diana D", party: :democrat})
  end
  
  describe 'initializes' do
    it 'exists' do
      expect(@diana).to be_an_instance_of(Candidate)
    end

    it 'has name' do
      expect(@diana.name).to eq("Diana D")
    end

    it 'has party' do
      expect(@diana.party).to eq(:democrat)
    end

    it 'has votes' do
      expect(@diana.votes).to eq(0)
    end
  end

  describe 'methods' do
    it 'can vote for' do
      @diana.vote_for
      @diana.vote_for
      @diana.vote_for
      expect(@diana.votes).to eq(3)
    end
  end
end