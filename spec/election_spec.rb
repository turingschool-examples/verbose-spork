require './spec/spec_helper.rb'

RSpec.describe Election do
  before(:each) do
    @election = Election.new("1554")
  end

  describe 'initialize' do
    it 'exists' do
      expect(@election).to be_an_instance_of(Election)
    end

    it 'has a year' do
      expect(@election.year).to eq("1554")
    end

    it 'has races array' do
      expect(@election.races).to eq([])
    end

    it 'has candidate array' do
      expect(@election.candidates).to eq([])
    end
    
    it 'has hash for vote count' do
      expect(@election.votes_count).to eq({})
    end
  end

  describe 'add race' do
    before(:each) do
      @election = Election.new("1554")
      @race = Race.new('Office')
      @candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
      @candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})
      @election.add_race(@race)
      @candidate1.vote_for
      @candidate1.vote_for
      @candidate2.vote_for
    end
    it 'can add race' do
      expect(@election.races).to eq([@race])
      @election.add_race(Race.new('office2'))
      expect(@election.races.count).to eq(2)
    end

    it 'can add candidates' do
      expect(@election.candidates).to eq([@candidate1, @candidate2])
    end

    it 'can vote count' do
      expect(@election.votes_count).to eq({"Diana D" => 2, "Roberto R" => 1})
    end
  end
end