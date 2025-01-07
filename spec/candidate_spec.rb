require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Candidate do 
    before(:each) do 
        @diana = Candidate.new({name: "Diana D", party: :democrat})
    end

    describe '#it_exists' do 
        it "creates a candidate" do 
            expect(@diana).to be_a Candidate
            expect(@diana.name).to eq("Diana D")
            expect(@diana.party).to eq(:democrat)
        end

        it "allows the candidate to vote" do 
            expect(@diana.votes).to eq(0)

            @diana.vote_for
            @diana.vote_for
            @diana.vote_for

            expect(@diana.votes).to eq(3)

            @diana.vote_for

            expect(@diana.votes).to eq(4)
        end
    end
end
