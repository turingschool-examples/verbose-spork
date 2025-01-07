require 'rspec'
require 'pry'
require './lib/candidate'

RSpec.describe Candidate do
    before(:each) do
        @diana = Candidate.new({name: "Diana D", party: :democrat})
    end

    describe 'initialize' do
        it 'exists' do
            expect(@diana).to be_an_instance_of(Candidate)
        end

        it 'has initialized traits' do
            expect(@diana.name).to eq("Diana D")
            expect(@diana.party).to eq(:democrat)
            expect(@diana.votes).to eq(0)
        end
    end

    describe 'can be voted for' do
        it 'counts votes' do
            @diana.vote_for
            @diana.vote_for
            @diana.vote_for

            expect(@diana.votes).to eq(3)

            @diana.vote_for

            expect(@diana.votes).to eq(4)
        end
    end
end