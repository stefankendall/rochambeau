module Throws
  ROCK = 0
  PAPER = 1
  SCISSORS = 2
end

def wins(p1_throw, p2_throw)
  p1_throw == Throws::ROCK and p2_throw == Throws::SCISSORS or p1_throw == Throws::PAPER and p2_throw == Throws::ROCK or p1_throw == Throws::SCISSORS and p2_throw == Throws::PAPER
end

TRIALS = 1000
GAME_END_WINS = 5
results = []
for trial in (1..TRIALS) do
  p1_wins = 0
  p2_wins = 0
  throws = 0
  until p1_wins == GAME_END_WINS or p2_wins == GAME_END_WINS do
    p1_throw = Random.rand(3)
    p2_throw = Random.rand(3)
    if wins(p1_throw, p2_throw)
      p1_wins += 1
      p2_wins = 0
    elsif wins(p2_throw, p1_throw)
      p2_wins += 1
      p1_wins = 0
    end
    throws += 1
  end
  results << throws
end

mean = results.inject{ |sum, el| sum + el}.to_f / results.size
sorted = results.sort
len = sorted.length
median = sorted[(len-1)/2] + sorted[len/2] / 2.0

puts "TRIALS: #{TRIALS}"
puts "mean throws to victory: #{mean}"
puts "median throws to victory: #{median}"

