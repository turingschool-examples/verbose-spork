require './lib/candidate'
require './lib/race'
require 'rspec'
require 'pry'


RSpec.describe Race do
    before(:each) do
        @race = Race.new("Texas Governor")
        
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
end