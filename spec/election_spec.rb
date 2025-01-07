require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  before(:each) do
    @election = Election.new("2024")
    @race1 = Race.new("Governor")
    @race2 = Race.new("Senator")
    
    @election.add_race(@race1)
    @election.add_race(@race2)
    
  end
  it "can return election year" do
    expect(@election.year).to eq("2024")
  end
  it "can add a race to the election" do
    expect(@election.races[0].office).to eq("Governor")
    expect(@election.races[1].office).to eq("Senator")
    expect(@election.races).to eq([@race1, @race2])
  end

  it "can return all candidates from every race" do

    @race1.register_candidate!({ name: "Diana D", party: :democrat })
    @race2.register_candidate!({ name: "Roberto R", party: :republican })
    
    
    candidates = @election.candidates

    
    expect(candidates.length).to eq(2)
    expect(candidates[0].name).to eq("Diana D")
    expect(candidates[0].party).to eq(:democrat)
    expect(candidates[1].name).to eq("Roberto R")
    expect(candidates[1].party).to eq(:republican)
    

  end
  
  it "can return the vote counts for each candidate" do
    
    @race1.register_candidate!({ name: "Diana D", party: :democrat })
    @race2.register_candidate!({ name: "Roberto R", party: :republican })

    expect(@election.vote_counts[@election.candidates[0].name]).to eq(0)
    expect(@election.vote_counts[@election.candidates[1].name]).to eq(0)
  
    
    # @election.candidates[0].vote_for  
    # @election.candidates[0].vote_for  
    # @election.candidates[0].vote_for  
    # @election.candidates[1].vote_for  
  
    
    # puts "Vote counts for Diana: #{@election.vote_counts[@election.candidates[0].name]}"
    # puts "Vote counts for Roberto: #{@election.vote_counts[@election.candidates[1].name]}"
  
    
    # vote_counts = @election.vote_counts
    # expect(vote_counts[@election.candidates[0].name]).to eq(3)  
    # expect(vote_counts[@election.candidates[1].name]).to eq(1)  
  end

end