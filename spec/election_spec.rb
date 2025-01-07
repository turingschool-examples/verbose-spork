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
    end
end