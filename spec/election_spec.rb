require 'rspec'
require 'pry'
require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
    before(:each) do
        @election = Election.new(2000)
    end

    describe 'initialize' do
        it 'exists' do
            expect(@election).to be_an_instance_of(Election)
        end

        it 'can tell year and races within year' do
            expect(@election.year).to eq(2000)
            expect(@election.races).to eq([])
        end
    end
end