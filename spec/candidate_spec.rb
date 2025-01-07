require './lib/candidate'

RSpec.describe Candidate do
    before(:each) do
        @diana = Candidate.new({name: "Diana D", party: :democrat})
    end

    it 'can initialize' do
        expect(@diana).to be_an_instance_of(Candidate)
        expect(@diana.name).to eq("Diana D")
        expect(@diana.party).to eq(:democrat)
        expect(@diana.votes).to eq(0)
    end

    it 'can increase vote count' do
        @diana.vote_for
        expect(@diana.votes).to eq(1)
        @diana.vote_for
        @diana.vote_for
        expect(@diana.votes).to eq(3)
    end
end