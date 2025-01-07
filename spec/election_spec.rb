# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Election do
  subject(:election) { described_class.new('2024') }

  describe '#initialize' do
    it { is_expected.to be_instance_of described_class }

    it 'has a year' do
      expect(election.year).to eq('2024')
    end

    it 'has no races' do
      expect(election.races).to eq([])
    end

    it 'has no candidates' do
      expect(election.candidates).to eq([])
    end
  end

  describe '#add_race' do
    let(:first_race) { instance_double(Race) }
    let(:second_race) { instance_double(Race) }

    it 'can add races' do
      election.add_race first_race
      election.add_race second_race

      expect(election.races).to eq([first_race, second_race])
    end
  end

  describe '#candidates' do
    let(:first_race) { instance_double(Race) }
    let(:second_race) { instance_double(Race) }
    let(:first_candidate) { instance_double(Candidate) }
    let(:second_candidate) { instance_double(Candidate) }
    let(:third_candidate) { instance_double(Candidate) }

    it 'can get all candidates' do
      election.add_race first_race
      election.add_race second_race
      allow(first_race).to receive(:candidates).and_return([first_candidate, second_candidate])
      allow(second_race).to receive(:candidates).and_return([third_candidate])

      expect(election.candidates).to eq([first_candidate, second_candidate, third_candidate])
    end
  end
end
