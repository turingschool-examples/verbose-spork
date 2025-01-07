# Election Day

## Preparation

* Fork this Repository
* Clone YOUR fork
* Compete the activity below
* Push your solution to your fork
* Submit a pull request from your repository to the turingschool-examples repository
  * Make sure to put your name in your PR!
  * Please include a reflection on how this challenge went for you.

## Iteration 1

Use TDD to create a `Candidate` class that responds to the following interaction pattern.

```ruby
require './lib/candidate'
=> true

pry(main)> diana = Candidate.new({name: "Diana D", party: :democrat})
=> #<Candidate:0x00007fd83736dbe0...>

pry(main)> diana.name
=> "Diana D"

pry(main)> diana.party
=> :democrat

pry(main)> diana.votes
=> 0

pry(main)> diana.vote_for

pry(main)> diana.vote_for

pry(main)> diana.vote_for

pry(main)> diana.votes
=> 3

pry(main)> diana.vote_for

pry(main)> diana.votes
=> 4
```

## Iteration 2

Use TDD to create a `Race` class that responds to the following interaction pattern.

The `register_candidate!` method must take a Hash as an argument and return an instance of `Candidate`.

```ruby
pry(main)> require './lib/candidate'
=> true

pry(main)> require './lib/race'
=> true

pry(main)> race = Race.new("Texas Governor")
=> #<Race:0x00007f9edf307688...>

pry(main)> race.office
=> "Texas Governor"

pry(main)> race.candidates
=> []

pry(main)> candidate1 = race.register_candidate({name: "Diana D", party: :democrat})
=> #<Candidate:0x00007f9edf376c90...>

pry(main)> candidate1.class
=> Candidate

pry(main)> candidate1.name
=> "Diana D"

pry(main)> candidate1.party
=> :democrat

pry(main)> candidate2 = race.register_candidate({name: "Roberto R", party: :republican})
=> #<Candidate:0x00007f9edf386780...>

pry(main)> race.candidates
=> [#<Candidate:0x00007f9edf376c90...>, #<Candidate:0x00007f9edf386780...>]
```

## Iteration 3

Use TDD to create an `Election` class that satisfies the following requirements.

You have been contacted by the local government to create a program that helps track their elections by organizing registered candidates and their votes.

| Method Name | Return Value |
| ----------- | ------------ |
| #new(year)        | An `Election` object that has an attribute of year (as a string). |
| #year       | The year of the election (string). |
| #races      | An array of `Race` objects. |
| #add_race(race)   | An array of `Race` objects. |
| #candidates | An array of all `Candidate` objects in the election. |
| #vote_counts | A hash with each candidate's name as a key and their count of votes as the value. |

# Election Tracker

## Interaction Pattern

```ruby
pry(main)> require './lib/candidate'
=> true

pry(main)> require './lib/race'
=> true

pry(main)> require './lib/election'
=> true

pry(main)> election = Election.new("2023") #the year of the election during initialization
=> #<Election:0x00007f9edf307688...>

pry(main)> election.year #object has an attribute of year as string
=> "2023"

pry(main)> election.races #object returns an array for races
=> []

pry(main)> race1 = Race.new("Texas Governor")
=> #<Race:0x00007f9edf376c90...>

pry(main)> race2 = Race.new("California Senator")
=> #<Race:0x00007f9edf386780...>

pry(main)> election.add_race(race1) #add race to array
=> [#<Race:0x00007f9edf376c90...>]

pry(main)> election.add_race(race2)
=> [#<Race:0x00007f9edf376c90...>, #<Race:0x00007f9edf386780...>]

pry(main)> election.races
=> [#<Race:0x00007f9edf376c90...>, #<Race:0x00007f9edf386780...>]

pry(main)> candidate1 = race1.register_candidate({name: "Diana D", party: :democrat})
=> #<Candidate:0x00007f9edf376c90...>

pry(main)> candidate2 = race1.register_candidate({name: "Roberto R", party: :republican})
=> #<Candidate:0x00007f9edf386780...>

pry(main)> candidate3 = race2.register_candidate({name: "Alice A", party: :independent})
=> #<Candidate:0x00007f9edf396890...>

pry(main)> election.candidates #an array of all candidate objects in the election
=> [#<Candidate:0x00007f9edf376c90...>, #<Candidate:0x00007f9edf386780...>, #<Candidate:0x00007f9edf396890...>]

pry(main)> candidate1.vote_for
=> 1

pry(main)> candidate1.vote_for
=> 2

pry(main)> candidate2.vote_for
=> 1

pry(main)> candidate3.vote_for
=> 1

pry(main)> candidate3.vote_for
=> 2

pry(main)> candidate3.vote_for
=> 3

pry(main)> election.vote_counts #a hash with each candidate's name as a key and their count of votes as the value
=> {
  "Diana D" => 2,
  "Roberto R" => 1,
  "Alice A" => 3
}
```



## Iteration 4

Use TDD to implement the following methods on the `Race` class.

The local government agency has contacted you about compiling addition information about each of the races.

| Method Name | Return Value |
| ----------- | ------------ |
| #open?      | A boolean indicating whether the race is open or not. A race should be open by default. |
| #close!     | Close the race (should no longer be open). |
| #winner     | `false` if the race is still open. It should return the candidate with the most votes if not open. If there is a tie, it should return any candidate with the highest number of votes. |
| #tie?       | A boolean indicating if two or more candidates received the highest number of votes. |

```ruby
pry(main)> require './lib/candidate'
=> true

pry(main)> require './lib/race'
=> true

pry(main)> race = Race.new("Texas Governor")
=> #<Race:0x00007f9edf307688...>

pry(main)> race.open? #boolen whether race is open or not - open by default
=> true

pry(main)> race.close! #close the race - action
=> false

pry(main)> race.open? #recheck
=> false

pry(main)> candidate1 = race.register_candidate({name: "Diana D", party: :democrat})
=> #<Candidate:0x00007f9edf376c90...>

pry(main)> candidate2 = race.register_candidate({name: "Roberto R", party: :republican})
=> #<Candidate:0x00007f9edf386780...>

pry(main)> candidate1.vote_for
=> 1

pry(main)> candidate1.vote_for
=> 2

pry(main)> candidate2.vote_for
=> 1

pry(main)> race.winner #false if open/return candidate with most votes if not open/if tie return any candidate with highest number of votes
=> false #should return Diana with 2 votes

pry(main)> race.close! #close the race

pry(main)> race.winner
=> #<Candidate:0x00007f9edf376c90...>

pry(main)> race.tie? #boolean if two or more candidates received the highest number of votes
=> false

pry(main)> candidate2.vote_for
=> 2

pry(main)> race.tie? #fixing the election after its closed 
=> true
```

Use TDD to implement the following methods on the `Election` class.

Additionally, the local government would like you to expand the information they have about their elections.

| Method Name | Return Value |
| ----------- | ------------ |
| #winners    | An array of the `Candidate` objects that represents the winner from each race. If the race is a tie or is still open, no winner should be returned for that race. |

## Interaction Pattern

```ruby
pry(main)> require './lib/candidate'
=> true

pry(main)> require './lib/race'
=> true

pry(main)> require './lib/election'
=> true

pry(main)> election = Election.new("2023")
=> #<Election:0x00007f9edf307688...>

pry(main)> race1 = Race.new("Texas Governor")
=> #<Race:0x00007f9edf376c90...>

pry(main)> race2 = Race.new("California Senator")
=> #<Race:0x00007f9edf386780...>

pry(main)> election.add_race(race1)
=> [#<Race:0x00007f9edf376c90...>]

pry(main)> election.add_race(race2)
=> [#<Race:0x00007f9edf376c90...>, #<Race:0x00007f9edf386780...>]

pry(main)> candidate1 = race1.register_candidate({name: "Diana D", party: :democrat})
=> #<Candidate:0x00007f9edf376c90...>

pry(main)> candidate2 = race1.register_candidate({name: "Roberto R", party: :republican})
=> #<Candidate:0x00007f9edf386780...>

pry(main)> candidate3 = race2.register_candidate({name: "Alice A", party: :independent})
=> #<Candidate:0x00007f9edf396890...>

pry(main)> candidate1.vote_for
=> 1

pry(main)> candidate1.vote_for
=> 2

pry(main)> candidate2.vote_for
=> 1

pry(main)> candidate3.vote_for
=> 1

pry(main)> candidate3.vote_for
=> 2

pry(main)> candidate3.vote_for
=> 3

pry(main)> race1.close!
=> false

pry(main)> race2.close!
=> false

pry(main)> election.winners
=> [#<Candidate:0x00007f9edf376c90...>, #<Candidate:0x00007f9edf396890...>]

pry(main)> candidate2.vote_for
=> 2

pry(main)> election.winners
=> [#<Candidate:0x00007f9edf396890...>]
```