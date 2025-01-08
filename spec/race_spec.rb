# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Race do
  subject(:race) { described_class.new('Texas Governor') }

  describe '#initialize' do
    it { is_expected.to be_instance_of described_class }

    it 'has an office' do
      expect(race.office).to eq('Texas Governor')
    end

    it 'has no candidates' do
      expect(race.candidates).to eq([])
    end

    it 'is open' do
      expect(race.open?).to be true
    end
  end

  describe '#register_candidate' do
    subject(:first_candidate) { race.register_candidate({ name: 'Diana D', party: :democrat }) }

    let(:second_candidate) { race.register_candidate({ name: 'Roberto R', party: :republican }) }

    it { is_expected.to be_instance_of Candidate }

    it 'can add registered candidates' do
      expect(race.candidates).to eq([first_candidate, second_candidate])
    end
  end

  describe '#close!' do
    it 'can close a race' do
      race.close!

      expect(race.open?).to be false
    end
  end

  describe '#winner' do
    subject(:winner) { race.winner }

    let(:first_candidate) { race.register_candidate({ name: 'Diana D', party: :democrat }) }

    let(:second_candidate) { race.register_candidate({ name: 'Roberto R', party: :republican }) }

    context 'when the race is open' do
      it { is_expected.to be false }
    end

    context 'when the race is closed' do
      before do
        2.times do
          first_candidate.vote_for
          second_candidate.vote_for
        end
        race.close!
      end

      context 'when the race is not tied' do # rubocop:disable RSpec/NestedGroups
        it 'gets the race winner' do
          first_candidate.vote_for

          expect(winner).to eq(first_candidate)
        end
      end

      context 'when the race is tied' do # rubocop:disable RSpec/NestedGroups
        it 'picks the race winner' do
          expect(winner).to eq(first_candidate)
        end
      end
    end
  end

  describe '#tie?' do
    subject(:tie) { race.tie? }

    let(:first_candidate) { race.register_candidate({ name: 'Diana D', party: :democrat }) }

    let(:second_candidate) { race.register_candidate({ name: 'Roberto R', party: :republican }) }

    context 'when the race is open' do
      it { is_expected.to be false }
    end

    context 'when the race is closed' do
      before do
        2.times do
          first_candidate.vote_for
          second_candidate.vote_for
        end
        race.close!
      end

      context 'when the race is not tied' do # rubocop:disable RSpec/NestedGroups
        before do
          first_candidate.vote_for
        end

        it { is_expected.to be false }
      end

      context 'when the race is tied' do # rubocop:disable RSpec/NestedGroups
        it { is_expected.to be true }
      end
    end
  end
end
