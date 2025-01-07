require './lib/candidate.rb'
require './lib/race.rb'
require './lib/election.rb'
require 'rspec'

describe Election do
  before do
    @election = Election.new("2020")
    @race = Race.new("Texas Governor")
    @diana = Candidate.new({name: "Diana D", party: :democrat})
    @roberto = Candidate.new({name: "Roberto R", party: :republican})
    @race.register_candidate(@diana)
    @race.register_candidate(@roberto)
  end

  describe "#initialize" do
    it 'exists' do
      expect(@election).to be_a(Election)
    end

    it 'has a year' do
      expect(@election.year).to eq("2020")
    end

    it 'has an array for tracking races' do
      expect(@election.races).to eq([])
    end

    it 'has an array for tracking candidates' do
      expect(@election.candidates).to eq([])
    end
  end


  describe "#add_race" do
    it 'can add a race to the election' do
      @election.add_race(@race)
      expect(@election.races).to eq([@race])
    end
  end

  describe '#candidates' do
    it 'can display a list of candidates' do
      expect(@race.candidates).to eq([@diana, @roberto])

      @election.add_race(@race)

      expect(@election.candidates).to eq([@diana, @roberto])
    end
  end

  describe '#candidates' do
    it 'can display a list of candidates and their votes' do
      @election.add_race(@race)
      expect(@election.candidates).to eq([@diana, @roberto])

      3.times {@diana.vote_for}
      2.times {@roberto.vote_for}

      expect(@election.vote_counts).to eq({"Diana D" => 3, "Roberto R" => 2})
    end
  end

  describe '#winners' do
    it 'can display the winners of an election' do
      @race.close!

      @race2 = Race.new("Minnesota Governor")
      @brock = Candidate.new({name: "Brock L", party: :republican})
      @kane = Candidate.new({name: "Kane W", party: :democrat})

      3.times {@brock.vote_for}
      2.times {@kane.vote_for}

      @race2.register_candidate(@brock)
      @race2.register_candidate(@kane)
      @race2.close!

      @race3 = Race.new("California Governor")
      @arnold = Candidate.new({name: "Arnold S", party: :democrat})
      @linda = Candidate.new({name: "Linda M", party: :republican})

      3.times {@arnold.vote_for}
      2.times {@linda.vote_for}

      @race3.register_candidate(@arnold)
      @race3.register_candidate(@linda)
      @race3.close!
      
      @election.add_race(@race)
      @election.add_race(@race2)
      @election.add_race(@race3)

      expect(@election.winners).to eq([@diana, @brock, @arnold])
    end
  end
end