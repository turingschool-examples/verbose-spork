require './lib/candidate'
require './lib/race'
require 'rspec'

RSpec.describe Race do
    before (:each) do
        @diana = Candidate.new({name: "Diana D", party: :democrat})
        @race = Race.new("Texas Governor")
    end

    it 'returns candidate position' do
        expect(@race.position_in_office).to eq("Texas Governor")

    end

    it 'returns [] for candidates' do
        expect(@race.candidates).to eq([])
    end

    it 'returns the candidates info and that they are in the race, once they have been registered' do 
        candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
        expect(candidate1.class).to be(Candidate)
        expect(candidate1.name).to eq("Diana D")
        expect(candidate1.party).to eq(:democrat)

        candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})
        expect(@race.candidates).to include(candidate1, candidate2)

    end
    

end