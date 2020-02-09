def game_hash
    hash = {
            :home=> {:team_name=> "Brooklyn Nets",
                     :colors=> ["Black", "White"],
                     :players=> [
                                  {:player_name=> "Alan Anderson",
                                   :number=> 0,
                                   :shoe=> 16,
                                   :points=> 22,
                                   :rebounds=> 12,
                                   :assists=> 12,
                                   :steals=> 3,
                                   :blocks=> 1,
                                   :slam_dunks=> 1}, 
                                  {:player_name=> "Reggie Evans",
                                   :number=> 30,
                                   :shoe=> 14,
                                   :points=> 12,
                                   :rebounds=> 12,
                                   :assists=> 12,
                                   :steals=> 12,
                                   :blocks=> 12,
                                   :slam_dunks=> 7}, 
                                  {:player_name=> "Brook Lopez",
                                   :number=> 11,
                                   :shoe=> 17,
                                   :points=> 17,
                                   :rebounds=> 19,
                                   :assists=> 10,
                                   :steals=> 3,
                                   :blocks=> 1,
                                   :slam_dunks=> 15},
                                  {:player_name=> "Mason Plumlee",
                                   :number=> 1,
                                   :shoe=> 19,
                                   :points=> 26,
                                   :rebounds=> 11,
                                   :assists=> 6,
                                   :steals=> 3,
                                   :blocks=> 8,
                                   :slam_dunks=> 5},
                                  {:player_name=> "Jason Terry",
                                   :number=> 31,
                                   :shoe=> 15,
                                   :points=> 19,
                                   :rebounds=> 2,
                                   :assists=> 2,
                                   :steals=> 4,
                                   :blocks=> 11,
                                   :slam_dunks=> 1}
                                ]
                    },
            :away=> {:team_name=> "Charlotte Hornets",
                     :colors=> ["Turquoise", "Purple"],
                     :players=> [ 
                                  {:player_name=> "Jeff Adrien",
                                   :number=> 4,
                                   :shoe=> 18,
                                   :points=> 10,
                                   :rebounds=> 1,
                                   :assists=> 1,
                                   :steals=> 2,
                                   :blocks=> 7,
                                   :slam_dunks=> 2}, 
                                  {:player_name=> "Bismack Biyombo",
                                   :number=> 0,
                                   :shoe=> 16,
                                   :points=> 12,
                                   :rebounds=> 4,
                                   :assists=> 7,
                                   :steals=> 22,
                                   :blocks=> 15,
                                   :slam_dunks=> 10}, 
                                  {:player_name=> "DeSagna Diop",
                                   :number=> 2,
                                   :shoe=> 14,
                                   :points=> 24,
                                   :rebounds=> 12,
                                   :assists=> 12,
                                   :steals=> 4,
                                   :blocks=> 5,
                                   :slam_dunks=> 5},
                                  {:player_name=> "Ben Gordon",
                                   :number=> 8,
                                   :shoe=> 15,
                                   :points=> 33,
                                   :rebounds=> 3,
                                   :assists=> 2,
                                   :steals=> 1,
                                   :blocks=> 1,
                                   :slam_dunks=> 0},
                                  {:player_name=> "Kemba Walker",
                                   :number=> 33,
                                   :shoe=> 15,
                                   :points=> 6,
                                   :rebounds=> 12,
                                   :assists=> 12,
                                   :steals=> 7,
                                   :blocks=> 5,
                                   :slam_dunks=> 12}
                                ]
                    }
    }
end

def num_points_scored(player_name)
    data = game_hash
    data.each { |key, value| 
      value.each { |key, value|
        if key == :players 
          value.each { |element|
            element.each { |key, value| 
              if value == player_name
                return element[:points]
              end
            }
          }
        end 
      }
    }
end

def shoe_size(player_name)
    data = game_hash
    data.each { |key, value| 
      value.each { |key, value|
        if key == :players
          value.each { |element| 
            element.each { |key, value|
              if value == player_name
                return element[:shoe]
              end
            }
          }
        end
      }
    }
end

def team_colors(team)
    data = game_hash
    data.each { |outer_key, outer_value| 
      outer_value.each { |key, value|
        if value == team
          return outer_value[:colors]
        end
      }
    }
end

def team_names
    teams = []
    data = game_hash
    data.each { |outer_key, outer_value| 
      outer_value.each { |key, value|
        if key == :team_name
          teams << value
        end
      }
    }
    return teams
end

def player_numbers(team)
    player_nums = []
    data = game_hash
    data.each { |outer_key, outer_value| 
      outer_value.each { |key, value| 
        if value == team 
          outer_value[:players].each { |element| 
            element.each { |element_key, element_value|
              if element_key == :number
                player_nums << element_value
              end
            }
          }
        end
      }
    }
    return player_nums
end

def player_stats(player)
    stats = {}
    data = game_hash
    data.each { |outer_key, outer_value| 
      outer_value.each { |key, value|
        if key == :players
          value.each { |element|
            if element[:player_name] == player
              element.each { |element_key, element_value| 
                stats[element_key] = element_value unless stats[element_key] = element_value
              }
            end
          }
        end
      }
    }
    stats.delete(:player_name)
    return stats
end

def big_shoe_rebounds
    sizes = []
    data = game_hash
    data.each { |key, value| 
      value.each { |mid_key, mid_value|
        if mid_key == :players 
          mid_value.each { |element| 
            element.each { |key, value|
              if key == :shoe
                sizes << value
              end
            }
          }
        end
      }
    }
    
    data.each { |key, value|
      value.each { |mid_key, mid_value|
        if mid_key == :players 
          mid_value.each { |element| 
            element.each { |key, value|
              if key == :shoe
                if value == sizes.max
                  return element[:rebounds]
                end
              end
            }
          }
        end
      }
    }
end

def most_points_scored
    points = []
    data = game_hash
    data.each { |key, value| 
      value.each { |mid_key, mid_value|
        if mid_key == :players 
          mid_value.each { |element| 
            element.each { |key, value|
              if key == :points
                points << value
              end
            }
          }
        end
      }
    }
    
    data.each { |key, value|
      value.each { |mid_key, mid_value|
        if mid_key == :players 
          mid_value.each { |element| 
            element.each { |key, value|
              if key == :points
                if value == points.max
                  return element[:player_name]
                end
              end
            }
          }
        end
      }
    }
end

def winning_team
    nets = 0
    hornets = 0

    data = game_hash

    data.each { |outer_key, outer_value|
      outer_value.each { |key, value|
        if value == "Brooklyn Nets"
          outer_value[:players].each { |element|
            element.each { |key, value|
              if key == :points 
                nets += value
              end
            }
          }
        end
        if value == "Charlotte Hornets"
          outer_value[:players].each { |element|
            element.each { |key, value|
              if key == :points 
                hornets += value
              end
            }
          }
        end
      }
    }
    return nets > hornets ? "Brooklyn Nets" : "Charlotte Hornets"
end

def player_with_longest_name
    length_of_names = []
    data = game_hash
    data.each { |outer_key, outer_value| 
      outer_value.each { |mid_key, mid_value| 
        if mid_key == :players
          mid_value.each { |element| 
            element.each { |key, value| 
              if key == :player_name
                length_of_names << value.length
              end
            }
          }
        end
      }
    }
    
    data.each { |outer_key, outer_value| 
      outer_value.each { |mid_key, mid_value| 
        if mid_key == :players
          mid_value.each { |element| 
            element.each { |key, value| 
              if key == :player_name
                if length_of_names.max == value.length
                  return value
                end
              end
            }
          }
        end
      }
    }
end

def player_with_most_steals
    steals = []
    data = game_hash
    data.each { |key, value| 
      value.each { |mid_key, mid_value|
        if mid_key == :players 
          mid_value.each { |element| 
            element.each { |key, value|
              if key == :steals
                steals << value
              end
            }
          }
        end
      }
    }
    
    data.each { |key, value|
      value.each { |mid_key, mid_value|
        if mid_key == :players 
          mid_value.each { |element| 
            element.each { |key, value|
              if key == :steals
                if value == steals.max
                  return element[:player_name]
                end
              end
            }
          }
        end
      }
    }
end

def long_name_steals_a_ton?
  return player_with_most_steals == player_with_longest_name ? true : false 
end