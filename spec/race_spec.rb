require 'spec_helper'

RSpec.describe Race do
  it 'exists and has attributes' do
    race = Race.new("Texas Governor")

    expect(race).to be_a(Race)
    expect(race.office).to eq("Texas Governor")
    expect(race.candidates).to eq([])
  end

  it 'can register candidates' do
    race = Race.new("Texas Governor")

    candidate1 = race.register_candidate({name: "Diana D", party: :democrat}) #name and party are keys in the details hash votes default to 0
    expect(candidate1).to be_a(Candidate)
    expect(candidate1.name).to eq("Diana D")
    expect(candidate1.party).to eq(:democrat)

    candidate2 = race.register_candidate({name: "Roberto R", party: :republican})
    expect(candidate2).to be_a(Candidate)
    expect(candidate2.name).to eq("Roberto R")
    expect(candidate2.party).to eq(:republican)

    expect(race.candidates).to eq([candidate1, candidate2])
  end

  it 'can check if race is open and close it' do
    race = Race.new("Texas Governor")

    expect(race.open?).to eq(true)

    race.close!

    expect(race.open?).to eq(false)
  end

  it 'can determine the winner' do
    race = Race.new("Texas Governor")
    candidate1 = race.register_candidate({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate({name: "Roberto R", party: :republican})

    candidate1.vote_for
    candidate1.vote_for
    candidate2.vote_for

    expect(race.winner).to eq(false)

    race.close!

    expect(race.winner).to eq(candidate1)
  end

  it 'can determine if there is a tie' do
    race = Race.new("Texas Governor")
    candidate1 = race.register_candidate({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate({name: "Roberto R", party: :republican})

    candidate1.vote_for
    candidate2.vote_for

    expect(race.tie?).to eq(false)

    race.close!

    expect(race.tie?).to eq(true)
  end
end
