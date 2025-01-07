require './spec/spec_helper.rb'

RSpec.describe Race do
  before(:each) do
    @race = Race.new("Texas Governor")
  end

  describe 'initialize' do
    it 'exists' do
      expect(@race).to be_an_instance_of(Race)
    end

    it 'has office' do
      expect(@race.office).to eq("Texas Governor")
    end

    it 'has array for candidates' do
      expect(@race.candidates).to eq([])
    end
  end

  describe 'methods' do
    before(:each) do
      @candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
    end

    it 'can register a candidate' do
      expect(@race.candidates).to eq([@candidate1])
    end

    it 'can read candidate details' do
      expect(@candidate1.name).to eq("Diana D")
      expect(@candidate1.party).to eq(:democrat)
      expect(@candidate1.class).to eq(Candidate)
    end

    it 'can store multiple candidates' do
      @candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})
      expect(@race.candidates).to eq([@candidate1, @candidate2])
    end
  end
end