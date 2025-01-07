require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do 
    before(:each) do 
        @election = Election.new("2008")
        @race = Race.new("Texas Governor")
        @candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
        @candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})
    end

    describe '#initalize' do 
        it 'creates an election' do 
            expect(@election).to be_a Election
            expect(@election.year).to eq("2008")
        end

        it 'adds to the race' do 
            expect(@election.races).to eq([])

            @election.add_race(@race)

            expect(@election.races).to eq([@race])
            expect(@election.candidates).to eq([@candidate1, @candidate2])
        end

        it 'counts votes for each candidate' do 
            @election.add_race(@race)

            @candidate1.vote_for
            @candidate1.vote_for
            @candidate1.vote_for
            @candidate1.vote_for
            @candidate1.vote_for
            @candidate1.vote_for
            @candidate2.vote_for
            @candidate2.vote_for
            @candidate2.vote_for
            @candidate2.vote_for

            expect(@election.vote_counts).to eq({"Diana D" => 6, "Roberto R" => 4})
        end
    end
end