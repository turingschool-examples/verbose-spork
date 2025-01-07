require './lib/candidate'
require './lib/race'
require './lib/election'
require 'pry'

RSpec.describe Election do 
    before(:each) do 
        @election_1 = Election.new("2029")
        @election_2 = Election.new("2033")

        @race_1 = Race.new("Virginia Governor")
        @race_2 = Race.new("California Attorney General")
    end

    describe '#instantiate' do 
        it 'exists' do 
            expect(@election_1).to be_an(Election)
            expect(@election_2).to be_an(Election)
        end

        it 'has a year' do 
            expect(@election_1.year).to eq("2029")
            expect(@election_2.year).to eq("2033")
        end

        it 'records election races' do 
            expect(@election_1.races).to eq([])
        end
    end

    describe '#add_race' do 
        it 'adds multiple races to the election year' do 
            @election_1.add_race(@race_1)

            expect(@election_1.races).to eq([@race_1])

            @election_1.add_race(@race_2)

            expect(@election_1.races).to eq([@race_1, @race_2])
        end
    end

    describe '#candidates' do 
        it 'collects all candidates from multiple races in an election year' do 
            @election_1.add_race(@race_1)
            @election_1.add_race(@race_2)

            candidate_1 = @race_1.register_candidate({name: "Sid V", party: :democrat})
            candidate_2 = @race_1.register_candidate({name: "Andy F", party: :republican})
            candidate_3 = @race_2.register_candidate({name: "Martha S", party: :democrat})
            candidate_4 = @race_2.register_candidate({name: "Kelly R", party: :republican})
            
            expect(@election_1.candidates).to eq([candidate_1, candidate_2, candidate_3, candidate_4])
        end
    end

    describe '#vote_counts' do 
        it 'returns a hash of candidates and their vote counts' do 
            @election_1.add_race(@race_1)
            @election_1.add_race(@race_2)

            @race_1.register_candidate({name: "Sid V", party: :democrat})
            @race_1.register_candidate({name: "Andy F", party: :republican})

            @race_2.register_candidate({name: "Martha S", party: :democrat})
            @race_2.register_candidate({name: "Kelly R", party: :republican})

            expect(@election_1.vote_counts).to eq({
                "Sid V" => 0,
                "Andy F" => 0,
                "Martha S" => 0,
                "Kelly R" => 0
            })
        end

        it 'adds vote counts from all candidates in the election' do
            @election_1.add_race(@race_1)
            @election_1.add_race(@race_2)
    
            candidate_1 = @race_1.register_candidate({name: "Sid V", party: :democrat})
            candidate_2 = @race_1.register_candidate({name: "Andy F", party: :republican})
            candidate_3 = @race_2.register_candidate({name: "Martha S", party: :democrat})
        
            candidate_1.vote_for
            candidate_1.vote_for
            candidate_1.vote_for

            candidate_2.vote_for

            candidate_3.vote_for
            candidate_3.vote_for
            candidate_3.vote_for
            candidate_3.vote_for
            candidate_3.vote_for

            expect(@election_1.vote_counts).to eq({
                "Sid V" => 3,
                "Andy F" => 1,
                "Martha S" => 5
            })
        end
    end
end 