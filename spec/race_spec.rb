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
  end

  describe '#register_candidate' do
    subject(:first_candidate) { race.register_candidate({ name: 'Diana D', party: :democrat }) }

    let(:second_candidate) { race.register_candidate({ name: 'Roberto R', party: :republican }) }

    it { is_expected.to be_instance_of Candidate }

    it 'can add registered candidates' do
      expect(race.candidates).to eq([first_candidate, second_candidate])
    end
  end
end
