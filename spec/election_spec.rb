require 'rspec'
require 'pry'
require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
    before(:each) do
        @election = Election.new("2000")

        @race = Race.new("Mayor of Toadtown")
    end

    describe 'initialize' do
        it 'exists' do
            expect(@election).to be_an_instance_of(Election)
        end

        it 'can tell year and races within year' do
            expect(@election.year).to eq("2000")
            expect(@election.races).to eq([])
        end
    end

    describe 'can check election information' do
        it 'can add and check races' do
            @election.add_race(@race)

            expect(@election.races).to eq([@race])
        end

        it 'can add and check candidates' do
            @election.add_race(@race)

            candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
            candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})

            expect(@election.candidates).to eq([candidate1, candidate2])
        end

        it 'can count votes for each candidate' do
            @election.add_race(@race)

            candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
            candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})

            candidate1.vote_for
            candidate1.vote_for
            candidate1.vote_for
            candidate2.vote_for
            candidate2.vote_for

            expect(@election.vote_counts).to eq({"Diana D": 3, "Roberto R": 2})
        end
    end
end