require "pry"
def game_hash
  game_data = {
    home: { team_name: "Brooklyn Nets",
            colors: ["Black", "White"],
            players: [
              { player_name: "Alan Anderson",
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1},

              { player_name: "Reggie Evans",
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7},

              { player_name: "Brook Lopez",
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15},

              { player_name: "Mason Plumlee",
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5},

              { player_name: "Jason Terry",
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1}
            ]

    },

    away: { team_name: "Charlotte Hornets",
            colors: ["Turquoise", "Purple"],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },

              { player_name: "Bismack Biyombo",
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10},

              { player_name: "DeSagna Diop",
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5},

              { player_name: "Ben Gordon",
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0},

              { player_name: "Kemba Walker",
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12}
            ]
    }
  }
end



def num_points_scored(chosen_name) # test is doing it - i think i'm iterating the name over the info i want so that the name => the points total
  game_hash.each do |home_away, team_data|
    team_data.each do |team_attributes, attribute_values|
      if team_attributes == :players
        attribute_values.each do |player_stats|
          if player_stats[:player_name] == chosen_name
            return player_stats[:points]
          end
        end
      end
    end
  end
end

def shoe_size(chosen_name)
  game_hash.each do |home_away, team_data|
    team_data.each do |team_attributes, attribute_values|
      if team_attributes == :players
        attribute_values.each do |player_stats|
          if player_stats[:player_name] == chosen_name
            return player_stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(chosen_team)
  game_hash.each do |location, team|
    if team[:team_name] == chosen_team
      return team[:colors]
    end
  end
end

def team_names
  game_hash.collect do |location, team| # can do with each but have to create and array and <<
    team[:team_name]
  end
end



def player_numbers(chosen_team) # couldn't use map for some reason
    #returns array of jerey #s for that team
  nums = []
  game_hash.each do |place, team|
    if team[:team_name] == chosen_team
      team.each do |attributes, data|
        if attributes == :players
          data.each do |player_stats|
            nums << player_stats[:number]
          end
        end
      end
    end
  end
  nums
end


def player_stats(chosen_name)
  new_hash = {}
  game_hash.each do |location, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player_stats|
          if player_stats[:player_name] == chosen_name
            new_hash = player_stats.delete_if do |k, v|
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
  #return the number of rebounds associated with the player that has the largest shoe size
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |location, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:shoe] > biggest_shoe
            biggest_shoe = player[:shoe]
            rebounds = player[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0
  high_scorer = nil
  game_hash.each do |location, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:points] > most_points
            most_points = player[:points]
            high_scorer = player[:player_name]
          end
        end
      end
    end
  end
  high_scorer
end

def winning_team
  nets = 0
  hornets = 0

  game_hash.each do |location, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if location == :home
            nets += player[:points]
          elsif location == :away
            hornets += player[:points]
            if nets > hornets
              return game_hash[:home][:team_name]
            else
              return game_hash[:away][:team_name]
            end
          end
        end
      end
    end
  end
end


def player_with_longest_name
  name_length = 0
  longest_name = nil
  game_hash.each do |location, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:player_name].length > name_length
            name_length = player[:player_name].length
            longest_name = player[:player_name]
          end
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  best_stealer = nil
  game_hash.each do |location, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:steals] > most_steals
            most_steals = player[:steals]
            best_stealer = player[:player_name]
            if player_with_longest_name = best_stealer
              return true
            end
          end
        end
      end
    end
  end
end










# rspec spec/hashketball_spec.rb -e game_hash
