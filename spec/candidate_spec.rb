require './lib/candidate'
require 'pry'

RSpec.describe Candidate do 
    before(:each) do 
        @diana = Candidate.new({name: "Diana D", party: :democrat})
    end

    describe '#instantiate' do 
        it 'exists' do 
            expect(@diana).to be_a(Candidate)
        end

        it 'has attributes' do 
            expect(@diana.name).to eq("Diana D")
            expect(@diana.party).to eq(:democrat)
        end

        it 'defaults to zero votes' do 
            expect(@diana.votes).to eq(0)
        end
    end

    describe '#vote_for' do 
        it 'can be voted for' do 
            @diana.vote_for
            @diana.vote_for
            @diana.vote_for

            expect(@diana.votes).to eq(3)
        end
    end
end