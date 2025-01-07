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
        
    end
end