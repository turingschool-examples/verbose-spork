require './lib/candidate'
require './lib/race'
require './lib/election' 
require 'rspec'

RSpec.describe Election do
    before (:each) do
        @diana = Candidate.new({name: "Diana D", party: :democrat})
        @roberto = Candidate.new({ name: "Roberto R", party: :republican })
        @race = Race.new("Texas Governor")
        @race.register_candidate({ name: "Diana D", party: :democrat })
        @race.register_candidate({ name: "Roberto R", party: :republican })
        @election = Election.new("2025")
    end

    it 'initializes' do
        expect(@election.year).to eq("2025")
        expect(@election.races).to eq([])
    end

    it 'adds races to the election' do
        @election.add_race(@race)
        expect(@election.races).to include(@race)
    end
    
    it "can list the candidates in the election" do
        @election.add_race(@race)
    
        candidate_names = @election.candidates.map do |candidate| 
            candidate.name
        end
        expect(candidate_names).to include("Diana D", "Roberto R")
      end
    
end