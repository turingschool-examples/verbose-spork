require './lib/candidate'
require './lib/race'
require './lib/election'
require 'rspec'
require 'pry'


RSpec.describe Election do
    before(:each) do
        @election = Election.new('2024')
        @race = Race.new("Texas Governor")
        @diana = Candidate.new({name: "Diana D", party: :democrat})
        @roberto = Candidate.new({name: "Roberto R", party: :republican})

    end

    it 'exists' do
        expect(@election).to be_an_instance_of(Election)
        expect(@election.year).to eq('2024')
        expect(@election.races).to be_an(Array)
    end

    it '#add_race(race)' do
        @election.add_race(@race)
        expect(@election.races).to eq([@race])
    end

    it '#candidates' do
        @election.add_race(@race)
        candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
        candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})
        expect(@race.candidates).to eq([candidate1, candidate2])
        expect(@election.candidates).to eq([candidate1, candidate2])
    end

    it '#vote_counts' do
        @election.add_race(@race)
        candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
        candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})
        @election.candidates
        candidate1.vote_for
        candidate2.vote_for
        expect(@election.vote_counts).to be_a(Hash)
        expect(@election.vote_counts).to eq({"Diana D"=>1, "Roberto R"=>1})
        
    end




end