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
  end
end
