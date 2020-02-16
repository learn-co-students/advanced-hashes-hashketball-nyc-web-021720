def game_hash 
  { 
  :away => { :team_name => "Charlotte Hornets",
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
            },
    :home => { :team_name => "Brooklyn Nets",
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
                 }
                 ]
            }
      }
end 

def num_points_scored(players_name)
  game_hash.each do |place, team| 
    team.each do |attribute, data| 
      if attribute == :players
        data.each do |player| 
          if player[:player_name] == players_name
            return player[:points]
          end 
        end 
      end 
    end 
  end 
end   


def shoe_size(players_name)
   game_hash.each do |place, team| 
    team.each do |attribute, data| 
      if attribute == :players
        data.each do |player| 
          if player[:player_name] == players_name
            return player[:shoe]
          end 
        end 
      end 
    end 
  end 
end 

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

def team_names
  game_hash.map do |place, team| 
    team[:team_name]
end
end

def player_numbers(team_name)
     nums = []
     game_hash.each do |place, team|
       if team[:team_name] == team_name
         team.each do |attributes, data|
           if attributes == :players 
             data.each do |player| 
               nums << player[:number]
              end 
            end 
          end 
        end 
      end 
    nums
  end   
 
 
def player_stats(players_name)
  new_hash ={}
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players 
        data.each do |player|
          if player[:player_name] == players_name
            new_hash = player.delete_if do |k, v|
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
  biggest = 0 
  rebounds = 0 
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      size = player[:shoe]
      if size > biggest
        biggest = size
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end


def most_points_scored
  most_points = 0
  highest_scorer = ""
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      points = player[:points]
      if points > most_points
        most_points = points
        highest_scorer = player[:player_name]
      end
    end
  end
  highest_scorer
end

def winning_team
  brooklyn_points = num_points_scored("Alan Anderson") + num_points_scored("Reggie Evans") + num_points_scored("Brook Lopez") + num_points_scored("Mason Plumlee") + num_points_scored("Jason Terry")
  charlotte_points = num_points_scored("Jeff Adrien") + num_points_scored("Bismack Biyombo") + num_points_scored("DeSagna Diop") + num_points_scored("Ben Gordon") + num_points_scored("Kemba Walker")
  if brooklyn_points > charlotte_points
    return "Brooklyn Nets"
  else
    return "Charlotte Hornets"
  end
end


def player_with_longest_name
  longest_name = nil
  game_hash.map do |team, team_level_stats|
    team_level_stats.map do |team_level_keys, team_level_values|
     if team_level_keys == :players
      longest_name = team_level_values.max_by{ |player_hash| player_hash[:player_name].length }
     end
    end
  end
  longest_name[:player_name]
end

def long_name_steals_a_ton?
  long_name_player = player_with_longest_name
  most_steals_player = nil
  game_hash.map do |team, team_level_stats|
    team_level_stats.map do |team_level_keys, team_level_values|
     if team_level_keys == :players
      most_steals_player = team_level_values.max_by{ |player_hash| player_hash[:steals] }
     end
    end
  end
  if most_steals_player[:player_name] == long_name_player
    return true
  end
end
