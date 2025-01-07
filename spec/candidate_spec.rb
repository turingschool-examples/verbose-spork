require 'rspec'
require './lib/candidate'

describe Candidate do
    before do
        @diana = Candidate.new({name: "Diana D", party: :democrat})
    end

    describe '#initialize' do
        it 'exists' do
            expect(@diana).to be_a(Candidate)
        end

        it 'has a name' do
            expect(@diana.name).to eq("Diana D")
        end

        it 'has a party' do
            expect(@diana.party).to eq(:democrat)
        end

        it 'starts with 0 votes' do
            expect(@diana.votes).to eq(0)
        end
    end

    describe '#vote_for' do
        it 'can be voted for' do
            3.times { @diana.vote_for }

            expect(@diana.votes).to eq(3)
        end
    end
end