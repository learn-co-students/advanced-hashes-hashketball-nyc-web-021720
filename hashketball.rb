# Write your code here!
def game_hash
  game_hash = {:home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [ {
      :player_name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1,
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
      :slam_dunks => 7,
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
      :slam_dunks => 15,
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
      :slam_dunks => 5,
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
      :slam_dunks => 1,
    }]},
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
      :slam_dunks => 2,
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
      :slam_dunks => 10,
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
      :slam_dunks => 5,
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
      :slam_dunks => 0,
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
      :slam_dunks => 12,
    }]}
    }
    game_hash
end

def num_points_scored(player)
  game_hash.each do |key, value|
    value[:players].each do |n|
      if n[:player_name] == player
        return n[:points]
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |key, value|
    value[:players].each do |n|
      if n[:player_name] == player
        return n[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |key, value|
    # puts "key is #{key} and value is #{value}"
    if value[:team_name] == team_name
      puts value[:colors]
      return value[:colors]
    end
  end
end

def team_names
  teams = []
  teams.append(game_hash[:home][:team_name])
  teams.append(game_hash[:away][:team_name])
  teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |key, value|
    if team_name == value[:team_name]
      value[:players].each do |n|
        numbers.append(n[:number])
        numbers
      end
    end
  end
  numbers
end

def player_stats(name)
  game_hash.each do |key, value|
    value[:players].each do |n|
      if n[:player_name] == name
        n.delete(:player_name)
        return n
      end
    end
  end
end

def big_shoe_rebounds
  rebounds = 0
  biggest_shoe = 0
  game_hash.each do |key, value|
    value[:players].each do |n|
      shoe_size = n[:shoe]
      if shoe_size > biggest_shoe
        rebounds = n[:rebounds]
        biggest_shoe = n[:shoe]
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0
  player = ''
  game_hash.each do |key, value|
    value[:players].each do |n|
      points = n[:points]
      if points > most_points
        player = n[:player_name]
        most_points = n[:points]
        player
      end
    end
  end
  player
end

def winning_team
  home_team_points = 0
  away_team_points = 0
  win = ''
  game_hash[:home][:players].each do |n|
    home_team_points += n[:points]
  end
  game_hash[:away][:players].each do |n|
    away_team_points += n[:points]
  end
  puts "Home points are #{home_team_points} Away points #{away_team_points}"
  if home_team_points > away_team_points
    win = game_hash[:home][:team_name]
  else
    win = game_hash[:away][:team_name]
  end
  win
end

def player_with_longest_name
  long_player = ''
  game_hash.each do |key, value|
    value[:players].each do |n|
      player_name = n[:player_name]
      puts player_name
      play_name_len = player_name.length
      long_player_len = long_player.length
      if play_name_len > long_player_len
        long_player = n[:player_name]
      end
    end
  end
  long_player
end

def long_name_steals_a_ton?
  most_steals = 0
  player = ''
  game_hash.each do |key, value|
    value[:players].each do |n|
      steals = n[:steals]
      if steals > most_steals
        player = n[:player_name]
        most_steals = n[:steals]
        player
      end
    end
  end
  if player_with_longest_name == player
    return true
  else
    return false
  end
end 
