require "yaml"

#
def game_hash
  game = {
    :home => {},
    :away => {}
  }

  create_team_hash(game, :home, "Brooklyn Nets", ["Black", "White"], "./data/home_team_players.yml")
  
  create_team_hash(game, :away, "Charlotte Hornets", ["Turquoise", "Purple"], "./data/away_team_players.yml")
  
  return game
end

#
def create_team_hash(game, key, team_name, colors, player_file)
  raw_players = load_player_data(player_file)
  players = convert_raw_player_data(raw_players)
  
  game[key] = {
    :team_name => team_name,
    :colors => colors,
    :players => players
  }
end

#
# I did the simplest copy of the player data possible to
# a set of files, to be read in and then converted
# to a more usable format
#
def load_player_data(path)
  YAML.load_file(path)
end

#
def convert_raw_player_data(raw_data)
  # we have a set of arrays with the same length
  players = []
  # just need to match up indexes of the inner arrays
  raw_data[:player_name].each_with_index do |name, index|
    player = {}
    raw_data.each_key do |key|
      player[key] = raw_data[key][index]
    end
    players << player
  end
  players
end

####################################################
#
# "insight" methods
#

#
def get_all_players(game)
  [game[:home][:players], game[:away][:players]].flatten
end

#
def search_array_for_player(players, name)
  players.find do |player|
    player[:player_name] == name
  end
end


#############################

#
def search_for_team_by_name(game, team_name)
  if game[:home][:team_name] == team_name then
    return game[:home]
  elsif game[:away][:team_name] == team_name then
    return game[:away]
  end
  
  nil
end

#
def search_for_player_by_name(game, name)
  all_players = get_all_players(game)
  player = search_array_for_player(all_players, name)
end

#
def num_points_scored(name)
  game = game_hash
  player = search_for_player_by_name(game, name)
  player ? player[:points] : nil
end

#
def shoe_size(name)
  game = game_hash
  player = search_for_player_by_name(game, name)
  player ? player[:shoe] : nil
end

#
def team_colors(team_name)
  game = game_hash
  team = search_for_team_by_name(game, team_name)
  team ? team[:colors] : nil
end

#
def team_names
  game = game_hash
  teams = [game[:home][:team_name], game[:away][:team_name]]
end

#
def player_numbers(team_name)
  game = game_hash
  team = search_for_team_by_name(game, team_name)
  if team then
    return team[:players].map do |player|
      player[:number]
    end
  end

  nil
end

#
def player_stats(name)
  game = game_hash
  player = search_for_player_by_name(game, name)
  if player then
    return {
      :number => player[:number],
        :shoe => player[:shoe],
        :points => player[:points],
        :rebounds => player[:rebounds],
        :assists => player[:assists],
        :steals => player[:steals],
        :blocks => player[:blocks],
        :slam_dunks => player[:slam_dunks]
    }
  end
  
  nil
end

#
def get_player_by_highest_stat(game)
  all_players = get_all_players(game)
  base = all_players[0]
  all_players.reduce(base) do |current_highest, next_player|
    yield(current_highest, next_player)
  end
end

#
def big_shoe_rebounds
  game = game_hash
  player = get_player_by_highest_stat(game) do |current_highest, next_player|
    next_player[:shoe] > current_highest[:shoe] ? next_player : current_highest
  end
  player ? player[:rebounds] : nil
end

#
def most_points_scored
  game = game_hash
  player = get_player_by_highest_stat(game) do |current_highest, next_player|
    next_player[:points] > current_highest[:points] ? next_player : current_highest
  end
  player[:player_name]
end

#
def player_with_longest_name
  game = game_hash
  player = get_player_by_highest_stat(game) do |current_highest, next_player|
    next_player[:player_name].length > current_highest[:player_name].length ? next_player : current_highest
  end
  player[:player_name]
end

#
def player_with_most_steals
  game = game_hash
  player = get_player_by_highest_stat(game) do |current_highest, next_player|
    next_player[:steals] > current_highest[:steals] ? next_player : current_highest
  end
  player[:player_name]
end

#
def long_name_steals_a_ton?
  longest = player_with_longest_name
  most_steals = player_with_most_steals
  return longest == most_steals
end

##########################

#
def winning_team 
  game = game_hash
  home_points = get_points_for_team(game[:home])
  away_points = get_points_for_team(game[:away])
  
  if home_points > away_points then
    return game[:home][:team_name]
  else
    return game[:away][:team_name]
  end
end

#
def get_points_for_team(team)
  team[:players].reduce(0) do |total, player|
    total += player[:points]
  end
end