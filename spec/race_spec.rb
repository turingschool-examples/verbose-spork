require './lib/candidate'
require './lib/race'
require './lib/election'
require 'rspec'
require 'pry'


RSpec.describe Race do
    before(:each) do
        @race = Race.new("Texas Governor")
        @election = Election.new('2024')
        @diana = Candidate.new({name: "Diana D", party: :democrat})
        @roberto = Candidate.new({name: "Roberto R", party: :republican})
    end

    it 'exists' do
        expect(@race).to be_an_instance_of(Race)
        expect(@race.office).to eq('Texas Governor')
        expect(@race.candidates).to be_an(Array)
    end

    it '#register_candidate' do
        candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
        expect(candidate1.class).to eq(Candidate)
        expect(candidate1.name).to eq('Diana D')
        expect(candidate1.party).to eq(:democrat)
        candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})
        expect(@race.candidates).to eq([candidate1, candidate2])
    end

    it '#open?' do
        expect(@race.open?).to eq(true)
    end

    it '#close!' do
        @race.close!
        expect(@race.close!).to eq(true)
    end

    # it '#winner' do
    #     @race.open?
    #     expect(@race.winner).to eq(false)
    #     @election.add_race(@race)
    #     candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
    #     candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})
    #     @election.candidates
    #     candidate1.vote_for
    #     candidate1.vote_for
    #     candidate2.vote_for
    #     expect(@election.vote_counts).to be_a(Hash)
    #     expect(@election.vote_counts).to eq({"Diana D"=>2, "Roberto R"=>1})
    #     @race.close!
    #     binding.pry
    # end
end