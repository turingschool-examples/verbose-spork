require './lib/candidate'
require 'rspec'


RSpec.describe Candidate do
    before(:each) do
        @diana = Candidate.new({name: "Diana D", party: :democrat})
    end

    it 'exists' do
        expect(@diana).to be_an_instance_of(Candidate)
        expect(@diana.name).to eq ("Diana D")
        expect(@diana.party).to eq(:democrat)
    end

    it '#vote_for' do
    expect(@diana.votes).to eq(0)
    @diana.vote_for
    @diana.vote_for
    @diana.vote_for
    expect(@diana.votes).to eq(3)
    @diana.vote_for
    expect(@diana.votes).to eq(4)
    end

end