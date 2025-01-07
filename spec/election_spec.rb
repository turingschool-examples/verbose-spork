require 'rspec'
require './lib/candidate'
require './lib/race'
require './lib/election'

describe Election do
    before do
        @election = Election.new(2024)

        @race1 = Race.new("Texas Governor")
        @race2 = Race.new("United States President")

        @prez_candidate1 = @race2.register_candidate({name: "Joe B", party: :democrat})
        @prez_candidate2 = @race2.register_candidate({name: "Donald T", party: :republican})

        @candidate1 = @race1.register_candidate({name: "Diana D", party: :democrat})
        @candidate2 = @race1.register_candidate({name: "Roberto R", party: :republican})
    end

    describe '#initialze' do
        it 'exists' do
            expect(@election).to be_a(Election)
        end

        it 'has a year' do
            expect(@election.year).to eq(2024)
        end

        it 'begins with no races' do
            expect(@election.races).to eq([])
        end
    end

    describe '#add_race' do
        it 'can add a race' do
            expect(@election.add_race(@race1)).to eq([@race1])
            expect(@election.add_race(@race2)).to eq([@race1, @race2])
        end
    end

    describe '#candidates' do
        it 'can list runnung candidates' do
            @election.add_race(@race2)
            @election.add_race(@race1)

            expect(@election.candidates).to eq([@prez_candidate1, @prez_candidate2, @candidate1, @candidate2])
        end
    end

    describe '#vote_counts' do
        it 'can count votes' do
            @election.add_race(@race2)
            @election.add_race(@race1)

            4.times { @election.candidates.each(&:vote_for) }

            votes = @election.vote_counts
            
            expect(votes["Donald T"]).to eq(4)
            expect(votes["Joe B"]).to eq(4)
            expect(votes["Diana D"]).to eq(4)
            expect(votes["Roberto R"]).to eq(4)
        end
    end

    describe '#winners' do
        it 'can returns the winners of all races' do
            @election.add_race(@race2)
            @election.add_race(@race1)
            @election.add_race(Race.new("race"))

            @prez_candidate1.vote_for

            @race1.close!
            @race2.close!

            expect(@election.winners).to eq([@prez_candidate1])
        end
    end
end