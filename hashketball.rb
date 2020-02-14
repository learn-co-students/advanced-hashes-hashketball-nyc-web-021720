require 'pry'

def game_hash
  
  hashketball = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
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
      :players => [
        {
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
        }]
    }
  }  
end 

def num_points_scored(find_name)
  # return number of points for player
  
    # go thru each hash
  game_hash.each do |away_home, team|
    
      # team will give { :team_name // :colors // :players }
      # so we want to iterate until we get to { :players } which contains array of hashes
    team.each do |attribute, data|
      
      if attribute == :players #means we found { :players }
        data.each do |player|
      
          if player[:player_name] == find_name # search for player
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size (find_player_shoe)
  # searches by player name for player shoe size, returns shoe size
  
  game_hash.each do |away_home, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == find_player_shoe
            return player[:shoe]
          end 
        end   
      end 
    end 
  end
end

def team_colors (team_name)
  # search for team name and return team colors 
  game_hash.each do |away_home, team|
    if team[:team_name] == team_name
      return team[:colors]
    end   
  end
end   

def team_names
  # return array with team names
  # since we're returning a new array we should use MAP vs EACH
  game_hash.map do |away_home, team|
    # team_array << team[:team_name]
    team[:team_name]
  end   
end   

def player_numbers(team_to_find)
  # takes in team name to search and returns array of jersey numbers for that team
  player_numbers = []
  game_hash.each do |away_home, team|
    if team[:team_name] == team_to_find
      team.each do |attributes, data|
        if attributes == :players
          data.each do |player_info|
            player_numbers << player_info[:number]
          end
        end
      end 
    end 
  end
  player_numbers
end   

def player_stats(player)
  # returns a hash of #{player} stats 
  new_hash = {}
  game_hash.each do |home_away, team|
    team.each do |team_info, data|
      if team_info == :players
        data.each do |player_info|
          if player_info[:player_name] == player 
            new_hash = player_info.delete_if do |k, v| # we want to remove player_name from hash
              k == :player_name
            end   
          end 
        end   
      end   
    end
  end
  new_hash    
end   

def big_shoe_rebounds
  # we want to return the # of rebounds the largest shoe size player has.
  largest_shoe_size = 0 
  rebounds = 0
  game_hash.each do |home_away, team|
    team.each do |team_info, data|
      if team_info == :players
        data.each do |player_info|
          if player_info[:shoe] > largest_shoe_size
            largest_shoe_size = player_info[:shoe]
            rebounds = player_info[:rebounds]
          end 
        end 
      end 
    end
  end   
  
  rebounds 
end   

def most_points_scored
  most_points = 0 
  high_score_player = ""
  game_hash.each do |home_away, team|
    team.each do |team_info, data|
      if team_info == :players 
        data.each do |player_info|
          if player_info[:points] > most_points
            most_points = player_info[:points]
            high_score_player = player_info[:player_name]
          end 
          
        end
      end 
    end   
  end
  high_score_player
  
end 

def winning_team
  home_team_score = 0 
  away_team_score = 0 
  
  game_hash.each do |home_away, team|
    if home_away == :home
      team.each do |team_info, data|
        if team_info == :players 
          data.each do |player_info|
            home_team_score += player_info[:points]
          end 
        end
      end 
    else 
      team.each do |team_info, data|
        if team_info == :players 
          data.each do |player_info|
            away_team_score += player_info[:points]
          end 
        end   
      end 
    end    
  end       
  
  if home_team_score > away_team_score
    return game_hash[:home][:team_name]
  else 
    return game_hash[:away][:team_name]
  end 
end

def player_with_longest_name
  name_length = 0 
  player_long_name = ""
    # go thru each hash
  game_hash.each do |away_home, team|
      # team will give { :team_name // :colors // :players }
      # so we want to iterate until we get to { :players } which contains array of hashes
    team.each do |attribute, data|
      if attribute == :players #means we found { :players }
        data.each do |player|
          # binding.pry
          if player[:player_name].length > name_length
            name_length = player[:player_name].length
            player_long_name = player[:player_name]
          end 
        end
      end
    end
  end
  player_long_name
end

def long_name_steals_a_ton?
  most_steals = 0 
  player_with_most = ""
  
  game_hash.each do |away_home, team|
    team.each do |attribute, data|
      if attribute == :players 
        data.each do |player|
          if player[:steals] > most_steals
            most_steals = player[:steals]
            player_with_most = player[:player_name]
          end   
        end  
      end  
    end  
  end   
  
  if player_with_most == player_with_longest_name
    return true
  else
    false
  end
  
  
end