require "pry"

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        },
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        },
      }
    }
  }
end

# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         binding.pry
#
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#             binding.pry
#       end
#     end
#   end
# end
#
# puts good_practices

def num_points_scored(name)
  points = nil
  hash_of_players = {}
  game_hash.each do |location, team_data|
    hash_of_players = team_data[:players]
    hash_of_players.each do |player, stats|
      if player == name
        points = hash_of_players[player][:points]
      end
    end
  end
  points
end

def shoe_size(name)
  size = nil
  hash_of_players = {}
  game_hash.each do |location, team_data|
    hash_of_players = team_data[:players]
    hash_of_players.each do |player, stats|
      if player == name
        size = hash_of_players[player][:shoe]
      end
    end
  end
  size
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team == team_data[:team_name]
      return team_data[:colors]
    end
  end
end

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team)
  team_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data[:players].each do |name, player_data|
        team_numbers << player_data[:number]
      end
    end
  end
  team_numbers
end

def player_stats(player)
  player_stats = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name == player
        player_stats = team_data[:players][player]
      end
    end
  end
  player_stats
end

def big_shoe_rebounds
  shoe_size = nil
  rebounds = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if (shoe_size == nil) || (shoe_size < stats[:shoe])
        shoe_size = stats[:shoe]
        rebounds = stats[:rebounds]
      else
        shoe_size
        rebounds
      end
    end
  end
  rebounds
end
