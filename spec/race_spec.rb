require './lib/candidate'
require './lib/race'
require 'pry'

RSpec.describe Race do 
    before(:each) do 
        @race = Race.new("Texas Governor")
    end

    describe '#instantiate' do 
        it 'exists' do 
            expect(@race).to be_a(Race)
        end

        it 'has an office' do 
            expect(@race.office).to eq("Texas Governor")
        end

        it 'has candidates' do 
            expect(@race.candidates).to eq([])
        end
    end

    describe '#register_candidate' do 
        it 'registers a candidate and returns an instance of Candidate' do 
            candidate_1 = @race.register_candidate({name: "Diana D", party: :democrat})

            expect(candidate_1).to be_a(Candidate) 
        end

        it 'adds candidate to candidates array' do 
            candidate_1 = @race.register_candidate({name: "Diana D", party: :democrat})

            expect(@race.candidates).to eq([candidate_1])
            expect(candidate_1.name).to eq("Diana D")
            expect(candidate_1.party).to eq(:democrat) 
        end

        it 'can add multiple candidates to the candidates array' do 
            candidate_1 = @race.register_candidate({name: "Diana D", party: :democrat})

            expect(@race.candidates).to eq([candidate_1])

            candidate_2 = @race.register_candidate({name: "Roberto R", party: :republican})

            expect(@race.candidates).to eq([candidate_1, candidate_2])
        end
    end
end