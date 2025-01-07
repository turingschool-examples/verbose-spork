require './lib/candidate'
require 'rspec'

describe Candidate do
  before do
    @diana = Candidate.new({name: "Diana D", party: :democrat})
  end

  it 'exists' do
    expect(@diana).to be_a(Candidate)
  end

  it 'has a name' do
    expect(@diana.name).to eq("Diana D")
  end

  it 'has a party' do
    expect(@diana.party).to eq(:democrat)
  end

  it 'has a vote counter' do
    expect(@diana.votes).to eq(0)
  end

  it 'can be voted for' do
    expect(@diana.votes).to eq(0)

    3.times do
      @diana.vote_for
    end

    expect(@diana.votes).to eq(3)

    @diana.vote_for

    expect(@diana.votes).to eq(4)
  end

end