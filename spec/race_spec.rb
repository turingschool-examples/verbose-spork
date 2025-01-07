require 'rspec'
require './lib/race'
require './lib/candidate'

describe Race do
    before do
        @race = Race.new("Texas Governor")
    end

    describe '#initialze' do
        it 'exists' do
            expect(@race).to be_a(Race)
        end
    end
end