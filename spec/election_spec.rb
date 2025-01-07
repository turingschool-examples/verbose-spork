require './lib/candidate'
require './lib/race'
require './lib/election'
require 'pry'
RSpec.describe Election do
    before(:each) do
        @election = Election.new
    end

    it 'can initialize' do
        expect(@election).to be_an_instance_of(Election)
    end

    it 'can add a new year' do
        @election.new(2025)
        expect(@election.year).to eq(2025)
    end

    it 'can add a race' do
        formula1 = @election.add_race('formula1')
        expect(@election.races.count).to eq(1)
        expect(@election.races[0].office).to eq('formula1')
    end

    it 'has candidates in the race' do
        formula1 = @election.add_race('formula1')
        expect(formula1.candidates).to eq([])
        formula1.register_candidate({name: "Diana D", party: :democrat})
        expect(formula1.candidates.count).to eq(1)
    end

    it 'returns name and votes of candidate' do
        formula1 = @election.add_race('formula1')
        formula1.register_candidate({name: "Diana D", party: :democrat})
        formula1.candidates[0].vote_for
        expect(@election.races[0].candidates[0].votes).to eq (1)
        expect(@election.vote_counts).to eq({"Diana D"=>1})
    end
end