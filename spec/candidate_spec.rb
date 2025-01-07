require 'spec_helper'

RSpec.describe Candidate do
  it 'exists and has attributes' do #test for the existence of the class and its attributes
    diana = Candidate.new({name: "Diana D", party: :democrat})  #takes a hash with name and party keys aka details

    expect(diana).to be_a(Candidate)
    expect(diana.name).to eq("Diana D")
    expect(diana.party).to eq(:democrat)
    expect(diana.votes).to eq(0)
  end

  it 'can receive votes' do
    diana = Candidate.new({name: "Diana D", party: :democrat})

    diana.vote_for 
    diana.vote_for
    diana.vote_for

    expect(diana.votes).to eq(3)

    diana.vote_for

    expect(diana.votes).to eq(4)
  end
end
