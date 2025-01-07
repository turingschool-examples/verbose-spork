# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Election do
  subject(:election) { described_class.new(2024) }

  describe '#initialize' do
    it { is_expected.to be_instance_of described_class }
  end
end
