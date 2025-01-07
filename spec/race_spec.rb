require './lib/candidate'
require './lib/race'

RSpec.describe Race do 
  before(:each) do
    @race = Race.new("Texas Governor")
    @candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
    @candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@race).to be_a Race
    end

    it 'has an office' do
      expect(@race.office).to eq("Texas Governor")
    end

    it 'defaults an empty array for candidates' do
      expect(@race.candidates).to eq([])
    end
  end

  describe '#register_candidate' do
    it 'exists' do
      expect(@candidate1.class).to be_a Candidate
    end

    it 'has a name' do
      expect(@candidate1.name).to eq("Diana D")
    end

    it 'has a party' do
      expect(@candidate1.party).to eq(:democrat)
    end

    it 'tracks candidates added to array' do
      expect(@race.candidates).to eq([@candidate1, @candidate2])
    end
  end
end
