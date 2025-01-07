# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Candidate do
  subject(:diana) { described_class.new({ name: 'Diana D', party: :democrat }) }

  describe '#initialize' do
    it { is_expected.to be_instance_of described_class }

    it 'has a name' do
      expect(diana.name).to eq('Diana D')
    end

    it 'has a party' do
      expect(diana.party).to eq(:democrat)
    end

    it 'has zero votes' do
      expect(diana.votes).to eq(0)
    end
  end

  describe '#vote_for' do
    it 'can add votes' do
      4.times do
        diana.vote_for
      end

      expect(diana.votes).to eq(4)
    end
  end
end
