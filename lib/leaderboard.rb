require 'pry'

require_relative "team.rb"

class Leaderboard

GAME_INFO = [
    {
      home_team: "Patriots",
      away_team: "Broncos",
      home_score: 17,
      away_score: 13
    },
    {
      home_team: "Broncos",
      away_team: "Colts",
      home_score: 24,
      away_score: 7
    },
    {
      home_team: "Patriots",
      away_team: "Colts",
      home_score: 21,
      away_score: 17
    },
    {
      home_team: "Broncos",
      away_team: "Steelers",
      home_score: 11,
      away_score: 27
    },
    {
      home_team: "Steelers",
      away_team: "Patriots",
      home_score: 24,
      away_score: 31
    }
]

attr_accessor :teams

  def initialize
    @teams = []
    GAME_INFO.each do |game|
      home_team = game[:home_team]
      away_team = game[:away_team]
      @teams << Team.new(home_team) if !@teams.any?{ |team| team.name == home_team }
      @teams << Team.new(away_team) if !@teams.any?{ |team| team.name == away_team }
    end
  end

  def game_results
    GAME_INFO.each do |score|
      home_team = score[:home_team]
      away_team = score[:away_team]
      score_home = score[:home_score]
      score_away = score[:away_score]
      home_index = @teams.find_index { |team| team.name == home_team }
      away_index = @teams.find_index { |team| team.name == away_team }

      if score_home > score_away
        @teams[home_index].add_win
        @teams[away_index].add_loss
      elsif score_home < score_away
        @teams[away_index].add_win
        @teams[home_index].add_loss
      end
    end
    @teams.sort_by! { |team| team.wins }.reverse!
  end

  def rank
    @teams.each_with_index do |team, index|
      team.rank = index + 1
    end
  end

  def display
    puts "---------------------------------------------------------\n"
    puts "| Name          Rank    Total Wins      Total Losses \t|\n"
    @teams.each do |team|
      if team.name == "Colts"
        puts "| #{team.name}\t\t#{team.rank}\t#{team.wins}\t\t#{team.losses}\t\t|"
      else
        puts "| #{team.name}\t#{team.rank}\t#{team.wins}\t\t#{team.losses}\t\t|"
      end
    end
    puts "---------------------------------------------------------\n"
  end
end

new_leaderboard = Leaderboard.new
new_leaderboard.game_results
new_leaderboard.rank
new_leaderboard.display
