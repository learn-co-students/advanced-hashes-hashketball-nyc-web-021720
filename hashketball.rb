require "pry"

def hashketball
end
def   game_hash  
baskt_hash = {:home => {:team_name => "team_name"  ,:colors => ["colors_time", "time_colors"] , :players => [{:player_name => "Jeff Adrien"  ,:number => 1 , :shoe => 1 ,:points => 10 ,:rebounds => 1 ,:assists => 1 ,:steals => 1 ,:blocks => 1 ,:slam_dunks => 1 },{:player_name =>"Bismack Biyombo"   ,:number => 1 , :shoe => 1 ,:points => 12 ,:rebounds => 1,:assists => 1 ,:steals => 1 , :blocks => 1 ,:slam_dunks => 1 },{:player_name =>"DeSagna Diop"   ,:number => 1 , :shoe => 1 ,:points => 24 ,:rebounds => 1,:assists => 1 ,:steals => 1 , :blocks => 1 ,:slam_dunks => 1 },{:player_name =>"ben gordon"   ,:number => 1 , :shoe => 1 ,:points => 33 ,:rebounds => 1,:assists => 1 ,:steals => 1 , :blocks => 1 ,:slam_dunks => 1 },{:player_name =>"string"   ,:number => 1 , :shoe => 1 ,:points => 6 ,:rebounds => 1,:assists => 1 ,:steals => 1 , :blocks => 1 ,:slam_dunks => 1 }]} ,
 :away => {:team_name => "team_name" ,:colors => ["colors_time", "time_colors"] , :players => [{:player_name => "string"  ,:number => 1 , :shoe => 1 ,:points => 10 ,:rebounds => 1 ,:assists => 1 ,:steals => 1 ,:blocks => 1 ,:slam_dunks => 1 },{:player_name => "string"  ,:number => 1 , :shoe => 1 ,:points => 12 ,:rebounds => 1 ,:assists => 1 ,:steals => 1 ,:blocks => 1 ,:slam_dunks => 1 },{ :player_name => "string"  ,:number => 1 , :shoe => 1 ,:points => 10 ,:rebounds => 1 ,:assists => 1 ,:steals => 1 ,:blocks => 1 ,:slam_dunks => 1 },{ :player_name => "string"  ,:number => 1 , :shoe => 1 ,:points => 10 ,:rebounds => 1 ,:assists => 1 ,:steals => 1 ,:blocks => 1 ,:slam_dunks => 1 },{:player_name =>"string"   ,:number => 1 , :shoe => 1 ,:points => 12 ,:rebounds => 1,:assists => 1 ,:steals => 1 , :blocks => 1 ,:slam_dunks => 1 }]}}

#binding.pry
# Write your code here!

return  baskt_hash
end

def num_points_scored(player_name)
  baskt_hash = game_hash
 
  
  baskt_hash[:home][:players].each do |has_array|
    
  #has_array.each do |team_level_key,team_value|
    
    if has_array[:players] ==  player_name 
       return  has_array[:points]
       
    else     
     baskt_hash[:away][:players].each do |has_array|  
     if has_array[:players] ==  player_name 
  
       return  has_array[:points]
  end
  
  end  #i += 1
  #binding.pry
  end
 
end
  
end







