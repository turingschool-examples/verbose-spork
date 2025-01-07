require './lib/race'

RSpec.describe Race do
    before(:each) do
        @race = Race.new("Texas Governor")
    end

    it 'can initialize' do
        expect(@race).to be_an_instance_of(Race)
    end

    it 'can register a candidate' do
        @race.register_candidate({name: "Diana D", party: :democrat})
        expect(@race.candidates.count).to eq(1)
    end

    it 'shows candidate class' do
        candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
        expect(candidate1.class).to be(Candidate)
    end

    it 'shows open or closed' do
        expect(@race.open?).to eq(true)
        @race.close!
        expect(@race.open).to eq(false)
    end

    it 'has a winner' do
        candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
        candidate2 = @race.register_candidate({name: "Willy B", party: :democrat})
        candidate1.vote_for
        candidate2.vote_for
        expect(candidate1.votes).to eq(1)
        expect(candidate2.votes).to eq(1)
        expect(@race.open).to eq(true)
        expect(@race.winner).to eq("the race continues!")
        candidate1.vote_for
        @race.close!
        expect(@race.open).to eq(false)
        expect(@race.winner).to eq("Winner: Diana D with 2 votes!")
    end

    # it 'can result in a tie' do
    #     candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
    #     candidate2 = @race.register_candidate({name: "Willy B", party: :democrat})
    #     candidate1.vote_for
    #     candidate2.vote_for
    #     expect(candidate1.votes).to eq(1)
    #     expect(candidate2.votes).to eq(1)
    #     expect(@race.tie?).to eq("it's a tie!")
    # end
end