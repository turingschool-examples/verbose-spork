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

        it 'has an office' do
            expect(@race.office).to eq("Texas Governor")
        end

        it 'begins with no candidates' do
            expect(@race.candidates).to eq([])
        end
    end
end