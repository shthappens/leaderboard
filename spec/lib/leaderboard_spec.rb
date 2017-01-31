require 'spec_helper'

RSpec.describe Leaderboard do
  let(:leaderboard) { Leaderboard.new }

  describe ".new" do
    it "creates a new array from game info" do
      expect(leaderboard.teams[0].name).to eq("Patriots")
    end
  end

  describe "game_results" do
    it "tallies wins and losses" do
      expect(leaderboard.game_results[0].wins).to eq(3)
    end
  end

  describe "rank" do
    it "creates a new array with teams ranked from 1 to 4" do
      expect(leaderboard.rank[0].name).to eq("Patriots")
    end
  end

  describe "display" do
    it "prints the leaderboard to the console" do
      expect(leaderboard.display).to eq(nil)
    end
  end
end
