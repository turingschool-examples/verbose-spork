require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Race do 
    before(:each) do 
        @race = Race.new("Texas Governor")
        @candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
        @candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})
    end

    describe '#initialize' do 
        it "creates a race" do
            expect(@race).to be_a Race
            expect(@race.office).to eq("Texas Governor")
        end

        it "adds candidates" do  
            expect(@candidate1.class).to eq(Candidate)
            expect(@candidate1.name).to eq("Diana D")
            expect(@candidate1.party).to eq(:democrat)
            expect(@race.candidates).to eq([@candidate1, @candidate2])
        end

        it "checks to see if the race is open" do 
            expect(@race.open?).to eq(true)

            @race.close!

            expect(@race.open?).to eq(false)
        end

        it "declares a winner!" do 
            expect(@race.winner).to eq(false)

            @race.close!

            expect(@race.winner).to eq("Diana D")
        end
    end
end