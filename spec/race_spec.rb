require 'rspec'
require 'pry'
require './lib/candidate'
require './lib/race'

RSpec.describe Race do
    before(:each) do
        @race = Race.new("Texas Govenor")
    end

    describe 'initialize' do
        it 'exists' do
            expect(@race).to be_an_instance_of(Race)
        end

        it 'can tell its initialized traits' do
            expect(@race.office).to eq("Texas Govenor")
            expect(@race.candidates).to eq([])
        end
    end

    describe 'candidates running for the race' do

    end
end