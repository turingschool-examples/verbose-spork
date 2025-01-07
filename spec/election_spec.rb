require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  before(:each) do
    @election = Election.new("2024")
  end

end