# Write your code here!
def game_hash 
  hash = {
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
      :players => [
          {:player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 3, 
          :blocks => 1, 
          :slam_dunks => 1 
          },
          {:player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 12, 
          :blocks => 12, 
          :slam_dunks => 7 
          },
          {:player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17, 
          :rebounds => 19, 
          :assists => 10, 
          :steals => 3, 
          :blocks => 1, 
          :slam_dunks => 15 
          },
          {:player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26, 
          :rebounds => 11, 
          :assists => 6, 
          :steals => 3, 
          :blocks => 8, 
          :slam_dunks => 5 
          },
          {:player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19, 
          :rebounds => 2, 
          :assists => 2, 
          :steals => 4, 
          :blocks => 11, 
          :slam_dunks => 1 
          }
        ]
    },

    :away => {
      :team_name => "Charlotte Hornets", 
      :colors => ["Turquoise", "Purple"],
      :players => [
          {:player_name => "Jeff Adrien",
          :number => 4, 
          :shoe => 18,
          :points => 10, 
          :rebounds => 1, 
          :assists => 1, 
          :steals => 2, 
          :blocks => 7, 
          :slam_dunks => 2
          },
          {:player_name => "Bismack Biyombo",
          :number => 0, 
          :shoe => 16,
          :points => 12, 
          :rebounds => 4, 
          :assists => 7, 
          :steals => 22, 
          :blocks => 15, 
          :slam_dunks => 10
          },
          {:player_name => "DeSagna Diop",
          :number => 2, 
          :shoe => 14,
          :points => 24, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 4, 
          :blocks => 5, 
          :slam_dunks => 5
          },
          {:player_name => "Ben Gordon",
          :number => 8, 
          :shoe => 15,
          :points => 33, 
          :rebounds => 3, 
          :assists => 2, 
          :steals => 1, 
          :blocks => 1, 
          :slam_dunks => 0
          },
          {:player_name => "Kemba Walker",
          :number => 33, 
          :shoe => 15,
          :points => 6, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 7, 
          :blocks => 5, 
          :slam_dunks => 12
          }
          ]
    }
}
end 

def num_points_scored(name)
  game_hash.each do |place, team|
    team.each do |player, values|
      if player == :players
        values.each do |arr|
          return arr[:points] if arr[:player_name] == name
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |place, team|
    team.each do |player, values|
      if player == :players
        values.each do |arr|
          return arr[:shoe] if arr[:player_name] == name
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |place, team|
    teams.push(team[:team_name])
  end
  return teams 
end

def player_numbers(team_name)
  numbers = [] 
  game_hash.each do |place, team|
    team.each do |player, values|
      if player == :players && team_name == team[:team_name]
        values.each do |key,value|
          numbers.push(key[:number]) 
        end
      end
    end
  end
  numbers
end

def player_stats(name)
  game_hash.each do |place, team|
    team.each do |players, value|
      if players == :players
        value.each do |player|
          if player[:player_name] == name 
            player.delete(:player_name)
            return player
          end
        end
      end
    end
  end
end 

def big_shoe_rebounds
  biggest_shoes = 0
  rebounds = 0
    game_hash.each do |team, team_info|
      team_info[:players].each do |player|
        if player[:shoe] > biggest_shoes
          biggest_shoes = player[:shoe]
          rebounds = player[:rebounds]
        end
      end
    end
  rebounds
end


def most_points_scored
  most_points = 0
  player = ""
  game_hash.each do |team, team_info|
    team_info[:players].each do |players|
      if players[:points] > most_points
        most_points = players[:points]
        player = players[:player_name]
      end
    end
  end
  player
end


def winning_team
  home_team = 0 
  away_team = 0 
  winning_team = ""
  game_hash.each do |place, team_info|
    team_info.each do |players, value|
      if players == :players
        value.each do |player|
          if place == :home 
            home_team += player[:points]
          else 
            away_team += player[:points]
          end
        end
      end
    end
  end
  if home_team > away_team
    winning_team = game_hash[:home][:team_name]
  else 
    winning_team = game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name_player = ""
  game_hash.each do |team, value|
    value[:players].each do |player|
      player_name_1 =  player[:player_name].length 
      player_name_2 = longest_name_player.length
      if player_name_1 > longest_name_player.length 
        longest_name_player = player[:player_name]
      end
    end
  end
  longest_name_player
end

def long_name_steals_a_ton?
  steals = 0 
  player = ""
  game_hash.each do |team, value|
    value[:players].each do |players|
      num_steals = players[:steals]
      if num_steals > steals 
        player = players[:player_name]
        steals = players[:steals]
      end
    end
  end
  player_with_longest_name == player 
end

#Needed a lot of help on this lab. Must come back to review. 