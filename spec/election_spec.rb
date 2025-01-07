require './lib/candidate.rb'
require './lib/race.rb'
require './lib/election'

RSpec.describe Election do
  before(:each) do
    @election = Election.new(2024)
    @race_texas = Race.new("Texas Governor")
    @race_california = Race.new("California State Auditor")

    @candidate_1 = @race_california.register_candidate({name: "Diana D", party: :democrat})
    @candidate_2 = @race_california.register_candidate({name: "Roberto R", party: :republican})
    @candidate_3 = @race_texas.register_candidate({name: "Jackson Griffiths", party: :independent})

  end

  it 'exists' do
    expect(@election).to be_a(Election)
  end

  it 'can initialize correctly' do
    expect(@election.year).to eq(2024)
    expect(@election.races).to eq([])
    expect(@election.candidates).to eq([])
    expect(@election.vote_counts).to eq({})

  end

  it 'tracks all races correctly' do
    @election.add_race(@race_texas)
    @election.add_race(@race_california)

    expect(@election.races).to eq([@race_texas, @race_california])
  end

  it 'tracks all candidates correctly' do
    @election.add_race(@race_texas)
    @election.add_race(@race_california)

    expect(@election.candidates).to eq([@candidate_3, @candidate_1, @candidate_2])
  end

  it 'can tally all candidate votes into a hash' do
    @election.add_race(@race_texas)
    @election.add_race(@race_california)

    @candidate_1.vote_for
    @candidate_1.vote_for
    @candidate_1.vote_for
    @candidate_2.vote_for
    @candidate_2.vote_for
    @candidate_3.vote_for

    expect(@election.vote_counts).to eq({"Diana D" => 3, "Roberto R" => 2, "Jackson Griffiths" => 1})
  end


end
