require 'rspec'
require './lib/candidate'
require './lib/race'
require './lib/election'

describe Election do
    before do
        @election = Election.new(2024)
    end

    describe '#initialze' do
        it 'exists' do
            expect(@election).to be_a(Election)
        end

        it 'has a year' do
            expect(@election.year).to eq(2024)
        end

        it 'begins with no races' do
            expect(@election.races).to eq([])
        end
    end
end