require 'spec_helper'
require_relative '../lib/ugly_trivia/game'
require_relative '../lib/ugly_trivia/mock_io'
require 'pp'

describe "example test" do
  xit "acceptance" do
    srand 8
    `ruby bin/trivia > foo.txt`
    expect(FileUtils).to be_identical("foo.txt", "new_output_2.txt")
    `rm foo.txt`
  end

  it "creates an unplayable game" do
    game = UglyTrivia::Game.new(UglyTrivia::MockIo.new)

    expect(game.how_many_players).to eq 0
    expect(game.is_playable?).to eq false
  end

  it "is unplayable with one player" do
    game = UglyTrivia::Game.new(UglyTrivia::MockIo.new)

    game.add("John")

    expect(game.how_many_players).to eq 1
    expect(game.is_playable?).to eq false
  end

  it "is playable with two players" do
    game = UglyTrivia::Game.new(UglyTrivia::MockIo.new)

    game.add("John")
    game.add("Marsha")

    expect(game.how_many_players).to eq 2
    expect(game.is_playable?).to eq true
  end

  it "cycle player" do
    game = UglyTrivia::Game.new(UglyTrivia::MockIo.new)

    game.add("John")
    game.add("Marsha")

    game.roll(1)
    game.wrong_answer

    pp game
  end
end
