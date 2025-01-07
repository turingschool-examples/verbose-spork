# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Race do
  subject(:race) { described_class.new('Texas Governor') }

  describe '#initialize' do
    it { is_expected.to be_instance_of described_class }
  end
end
