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

    it 'is open by default' do
      expect(@election.open?).to eq(true)
    end
  end

  describe 'methods' do
    it 'can close' do
      @election.close!
      expect(@election.open?).to eq(false)
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

    it 'winner is false if race is open' do
      expect(@election.winner).to eq(false)
    end

    it 'has winner' do
      @election.close!
      expect(@election.winner).to eq(@candidate1)
    end

    it 'is tie' do
      @election.close!
      @candidate2.vote_for
      @election.winner
      expect(@election.tie?).to eq(true)
      expect(@election.winners).to eq([])
    end

    it 'has a winner' do
      @election.close!
      @election.winner
      expect(@election.winners).to eq([@candidate1])
    end
  end

  describe 'testing more than one race at a time' do
    before(:each) do
      @election = Election.new("1554")

      @race = Race.new('Office')
      @candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
      @candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})
      @election.add_race(@race)
      @candidate1.vote_for
      @candidate1.vote_for
      @candidate2.vote_for

      @race_2 = Race.new('Prez')
      @candidate_1 = @race_2.register_candidate({name: "Diana D", party: :democrat})
      @candidate_2 = @race_2.register_candidate({name: "Roberto R", party: :republican})
      @election.add_race(@race_2)
      @candidate_1.vote_for
      @candidate_2.vote_for
      @candidate_2.vote_for

      @race_3 = Race.new('Chair')
      @candidate_a = @race_3.register_candidate({name: "Diana D", party: :democrat})
      @candidate_b = @race_3.register_candidate({name: "Roberto R", party: :republican})
      @election.add_race(@race_3)
      @candidate_a.vote_for
      @candidate_b.vote_for

      @election.close!
      @election.winner
    end
    
    it 'has winners' do
      expect(@election.winners).to eq([@candidate1, @candidate_2])
    end
  end
end