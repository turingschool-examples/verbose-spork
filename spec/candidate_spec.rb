require './lib/candidate'

RSpec.describe Candidate do
  before(:each) do
      @diana = Candidate.new({name: "Diana D", party: :democrat})
  end

  it "can display a candidate" do
    expect(@diana).to be_an_instance_of(Candidate)
  end

  it "has a name and party" do
    expect(@diana.name).to eq("Diana D")
    expect(@diana.party).to eq(:democrat)
  end

  it "can display candidate votes" do
    expect(@diana.votes).to eq(0) 

    @diana.vote_for
    @diana.vote_for
    @diana.vote_for

    expect(@diana.votes).to eq(3)

    @diana.vote_for

    expect(@diana.votes).to eq(4)
  end

end