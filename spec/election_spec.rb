require 'spec_helper'

RSpec.describe Election do
  it 'exists and has attributes' do
    election = Election.new("2023")

    expect(election).to be_a(Election)
    expect(election.year).to eq("2023")
    expect(election.races).to eq([])
  end

  it 'can add races and list candidates' do
    election = Election.new("2023")
    race1 = Race.new("Texas Governor")
    race2 = Race.new("California Senator")

    election.add_race(race1)
    election.add_race(race2)

    expect(election.races).to eq([race1, race2])

    candidate1 = race1.register_candidate({name: "Diana D", party: :democrat})
    candidate2 = race1.register_candidate({name: "Roberto R", party: :republican})
    candidate3 = race2.register_candidate({name: "Alice A", party: :independent})

    expect(election.candidates).to eq([candidate1, candidate2, candidate3])
  end

  it 'can count votes' do
    election = Election.new("2023")
    race1 = Race.new("Texas Governor")
    race2 = Race.new("California Senator")

    election.add_race(race1)
    election.add_race(race2)

    candidate1 = race1.register_candidate({name: "Diana D", party: :democrat})
    candidate2 = race1.register_candidate({name: "Roberto R", party: :republican})
    candidate3 = race2.register_candidate({name: "Alice A", party: :independent})

    candidate1.vote_for
    candidate1.vote_for
    candidate2.vote_for
    candidate3.vote_for
    candidate3.vote_for
    candidate3.vote_for

    expect(election.vote_counts).to eq({
      "Diana D" => 2,
      "Roberto R" => 1,
      "Alice A" => 3
    })
  end
end
