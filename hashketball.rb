def game_hash
  game = {
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
				:player_name => 'Reggie Evans',
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
			}]
    }
	}
  return game
end

def num_points_scored (player_name)
  game = game_hash
  #First attempt to find player_name in home team
	home_team_players = game[:home][:players]

	home_team_players.each do |player|
		if (player[:player_name] == player_name)
			return player[:points]
		end
	end

  #Then attempt to find player_name in away team
	away_team_players = game[:away][:players]

	away_team_players.each do |player|
		if (player[:player_name] == player_name)
			return player[:points]
		end
	end
	#return nil if name doesent exist
  return nil
end

def shoe_size(player_name)
  game = game_hash

	home_team_players = game[:home][:players]

	home_team_players.each do |player|
		if (player[:player_name] == player_name)
			return player[:shoe]
		end
	end

	away_team_players = game[:away][:players]

	away_team_players.each do |player|
		if (player[:player_name] == player_name)
			return player[:shoe]
		end
	end

  return nil
end

def team_colors (team_name)
  game = game_hash

	home_team = game[:home]
  if (team_name == home_team[:team_name])
    return home_team[:colors]
  end

  away_team = game[:away]
  if (team_name = away_team[:team_name])
    return away_team[:colors]
  end
    return nil
end

def team_name (team_name)
  game = game_hash

	home_team = game[:home]
  if (team_name == home_team[:team_name])
    return home_team[:team_name]
  end

  away_team = game[:away]
  if (team_name = away_team[:team_name])
    return away_team[:team_name]
  end
    return nil
end

def shoe_size(player_name)
  game = game_hash

	home_team_players = game[:home][:players]

	home_team_players.each do |player|
		if (player[:player_name] == player_name)
			return player[:shoe]
		end
	end

	away_team_players = game[:away][:players]

	away_team_players.each do |player|
		if (player[:player_name] == player_name)
			return player[:shoe]
		end
	end

  return nil
end

def team_names
  game = game_hash
  names = []
  names << game[:home][:team_name]
  names << game[:away][:team_name]

  return names
end

def player_numbers (team_name)
  game = game_hash

	home_team = game[:home]
  if (team_name == home_team[:team_name])
		names = []
		home_team[:players].each do |x|
		names << x[:number]
		end
		return names
  end

  away_team = game[:away]
  if (team_name == away_team[:team_name])
		names = []
		away_team[:players].each do |x|
		names << x[:number]
		end
		return names
  end

    return nil
end

def player_stats(player_name)
  game = game_hash

	home_team_players = game[:home][:players]
	home_team_players.each do |player|
		if (player[:player_name] == player_name)
			return player.slice(:number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks, :steals)
		end
	end

	away_team_players = game[:away][:players]
	away_team_players.each do |player|
		if (player[:player_name] == player_name)
			return player.slice(:number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks, :steals)
		end
	end

  return nil
end

def big_shoe_rebounds
	game = game_hash
	player_with_biggest_shoe = game[:home][:players][0]

	#first loop compares the home team to biggest_shoe
	home_team_players = game[:home][:players]
	home_team_players.each do |player|
		if (player[:shoe] > player_with_biggest_shoe[:shoe])
			player_with_biggest_shoe = player
		end
	end

	#second loop compares the away team to the biggest_shoe
	away_team_players = game[:away][:players]
	away_team_players.each do |player|
		if (player[:shoe] > player_with_biggest_shoe[:shoe])
			player_with_biggest_shoe = player
		end
	end

	return player_with_biggest_shoe[:rebounds]
end

def most_points
  
end
