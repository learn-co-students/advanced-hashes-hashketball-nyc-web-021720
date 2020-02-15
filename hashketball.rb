# Write your code here!
def game_hash
  stats = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      }, 
      {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      {
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      {
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      {
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }]
      
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      }, 
      {
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
      {
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      {
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      {
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }]}
  }
  return stats
end

def num_points_scored(player_name)
  # find home team stats firsts
  players = game_hash
  
  players[:home][:players].each do |player|
    if player_name == player[:player_name]
      return player[:points]
    end
  end
  #find away team stats next
  players[:away][:players].each do |player|
    if player_name == player[:player_name]
      return player[:points]
    end
  end
  return nil
end

def shoe_size(player_name)
  # find home team stats firsts
  players = game_hash
  
  players[:home][:players].each do |player|
    if player_name == player[:player_name]
      return player[:shoe]
    end
  end
  #find away team stats next
  players[:away][:players].each do |player|
    if player_name == player[:player_name]
      return player[:shoe]
    end
  end
  return nil
end

def team_colors(team)
  #check home first
  team_info = game_hash
  
  if team == team_info[:home][:team_name]
    return team_info[:home][:colors]
  end
  
  if team == team_info[:away][:team_name]
    return team_info[:away][:colors]
  end
  return nil
end
  
def team_names
  teams_info = game_hash
  team_name_array = []
  team_name_array << teams_info[:home][:team_name]
  team_name_array << teams_info[:away][:team_name]
  
  return team_name_array
end

def player_numbers(team_name)
  jersey_arrary = []
  team_info = game_hash
   
  if team_name == team_info[:home][:team_name]
   home_team_info = team_info[:home]
    home_team_info[:players].each do |player|
      jersey_arrary << player[:number]
    end
   elsif team_name == team_info[:away][:team_name]
    away_team_info = team_info[:away]
      away_team_info[:players].each do |player|
        jersey_arrary << player[:number]
        end
  end
  return jersey_arrary
end

def player_stats(player_name)
  player_stats = game_hash
  
  player_stats[:home][:players].each do |player|
    if player_name == player[:player_name]
      return player.slice(:number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks)
    end
  end
  #find away team stats next
  player_stats[:away][:players].each do |player|
    if player_name == player[:player_name]
      return player.slice(:number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks)
    end
  end
  return nil
end

def big_shoe_rebounds
  game_info = game_hash
  big_shoe_player = game_info[:home][:players][0]
  
    game_info[:home][:players].each do |player|
     if big_shoe_player[:shoe] < player[:shoe]
       big_shoe_player = player
     end
   end
      
    game_info[:away][:players].each do |player|
     if big_shoe_player[:shoe] < player[:shoe]
       big_shoe_player = player
     end
   end
     return big_shoe_player[:rebounds]
end

def most_points_scored
  game_stats = game_hash
  most_points = game_stats[:home][:players][0]
  
  game_stats[:home][:players].each do |player|
    if most_points[:points] < player[:points]
      most_points = player
    end
  end
  
  game_stats[:away][:players].each do |player|
    if most_points[:points] < player[:points]
      most_points = player
    end
  end
  return most_points[:player_name]
end

def winning_team
  home_total = 0
  away_total = 0
  
  game_hash[:home][:players].each do |player|
    home_total += player[:points]
  end
  
  game_hash[:away][:players].each do |player|
    away_total += player[:points]
  end
  
  if home_total > away_total 
    return game_hash[:home][:team_name]
  else
    return game_hash[:away_total][:team_name]
  end
end

def player_with_longest_name
  long_name = game_hash[:home][:players][0]
  
  
   game_hash[:home][:players].each do |player|
    if long_name[:player_name].length < player[:player_name].length
      long_name = player
    end
  end
      
    game_hash[:away][:players].each do |player|
    if long_name[:player_name].length < player[:player_name].length
      long_name = player
    end
  end
    return long_name[:player_name]
end

def long_name_steals_a_ton?
  most_steals = game_hash[:home][:players][0]
  long_name = game_hash[:home][:players][0]
  
  #most steals
  game_hash[:home][:players].each do |player|
    if most_steals[:steals] < player[:steals]
      most_steals = player
     end
    end
  
  game_hash[:away][:players].each do |player|
      if most_steals[:steals] < player[:steals]
      most_steals = player
      end
    end
 
 # longest name
  game_hash[:home][:players].each do |player|
     if long_name[:player_name].length < player[:player_name].length
      long_name = player
      end
    end
      
    game_hash[:away][:players].each do |player|
    if long_name[:player_name].length < player[:player_name].length
      long_name = player
      end
    end
  return most_steals == long_name 
end