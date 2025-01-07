require 'rspec'
require 'pry'
require './lib/candidate'
require './lib/race'

RSpec.describe Race do
    before(:each) do
        @race = Race.new("Texas Govenor")
    end

    describe 'initialize' do
        it 'exists' do
            expect(@race).to be_an_instance_of(Race)
        end

        it 'can tell its initialized traits' do
            expect(@race.office).to eq("Texas Govenor")
            expect(@race.candidates).to eq([])
        end
    end

    describe 'candidates running for the race' do
        it 'can register candidates' do
            candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
            candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})

            expect(@race.candidates).to eq([candidate1, candidate2])
        end

        it 'can tell about the candidates' do
            candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
            candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})
            
            expect(candidate1.class).to eq(Candidate)
            expect(candidate1.name).to eq("Diana D")
            expect(candidate1.party).to eq(:democrat)

            expect(candidate2.name).to eq("Roberto R")
            expect(candidate2.party).to eq(:republican)
        end
    end

    describe 'can tell status information about race' do
        it 'can tell if it is an open race' do
            expect(@race.open?).to eq(true)
        end

        it 'can close a race' do
            @race.close!

            expect(@race.open?).to eq(false)
        end

        it 'can tell winner' do

            candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
            candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})

            candidate1.vote_for
            candidate1.vote_for
            candidate1.vote_for
            candidate2.vote_for
            candidate2.vote_for

            @race.close!

            expect(@race.winner).to eq(candidate1)
            expect(@race.tie?).to eq(false)
        end

        it 'can tell a tie' do

            candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
            candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})

            candidate1.vote_for
            candidate1.vote_for
            candidate1.vote_for
            candidate2.vote_for
            candidate2.vote_for
            candidate2.vote_for

            @race.close!

            expect(@race.winner).to eq(nil)
            expect(@race.tie?).to eq(true)
        end
    end
end