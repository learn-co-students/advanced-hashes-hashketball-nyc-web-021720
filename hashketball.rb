require "pry"

def hashketball
end
def   game_hash  
baskt_hash = {:home => {:team_name => "Brooklyn Nets"  ,:colors => ["Black", "White"] , :players => [{:player_name => "Jeff Adrien"  ,:number => 4 , :shoe => 18 ,:points => 10 ,:rebounds => 1 ,:assists => 1 ,:steals => 2 ,:blocks => 7 ,:slam_dunks => 2 },{:player_name =>"Bismack Biyombo"   ,:number => 0 , :shoe => 16 ,:points => 12 ,:rebounds => 4,:assists => 7 ,:steals => 22 , :blocks => 15 ,:slam_dunks =>10},{:player_name =>"DeSagna Diop"   ,:number => 2 , :shoe => 14 ,:points => 24 ,:rebounds => 12,:assists => 12 ,:steals => 4 , :blocks => 5 ,:slam_dunks => 5 },{:player_name =>"Ben Gordon"   ,:number => 8 , :shoe => 15 ,:points => 33 ,:rebounds => 3,:assists => 2 ,:steals => 1 , :blocks => 1 ,:slam_dunks => 0 },{:player_name =>"Kemba Walker"  ,:number => 33 , :shoe => 15 ,:points => 6 ,:rebounds => 12,:assists => 12 ,:steals => 7 , :blocks => 5 ,:slam_dunks => 12 }]} ,
  :away => {:team_name => "Charlotte Hornets" ,:colors => ["Turquoise", "Purple"] , :players => [{:player_name => "Alan Anderson"  ,:number => 0 , :shoe => 16 ,:points => 22 ,:rebounds => 12 ,:assists => 12 ,:steals => 3 ,:blocks => 1 ,:slam_dunks => 1 },{:player_name => "Reggie Evans"  ,:number => 30 , :shoe => 14 ,:points => 12 ,:rebounds => 12 ,:assists => 12 ,:steals => 12 ,:blocks => 12 ,:slam_dunks => 7 },{ :player_name => "Brook Lopez"  ,:number => 11 , :shoe => 17 ,:points => 17 ,:rebounds => 19 ,:assists => 10 ,:steals => 3,:blocks => 1 ,:slam_dunks => 15 },{ :player_name => "Mason Plumlee"  ,:number => 1 , :shoe => 19 ,:points => 26 ,:rebounds => 11 ,:assists => 6 ,:steals => 3 ,:blocks => 8,:slam_dunks => 5 },{:player_name =>"Jason Terry"   ,:number => 31 , :shoe => 15 ,:points => 19 ,:rebounds => 2,:assists => 2 ,:steals => 4 , :blocks => 11 ,:slam_dunks => 1 }]}}

#binding.pry
# Write your code here!

return  baskt_hash
end

def num_points_scored(player_name)
  baskt_hash = game_hash
 
  
  baskt_hash.each do |key,value|
   
  value.each do |team_level_key,team_value|
     
    if team_level_key == :players  
      
      team_value.each do |stats|
        stats.each do |stats_key,stats_value|
         
        if stats_value == player_name
          
          
          
        return  stats[:points]  
       
    #else     
   #  baskt_hash[:away][:players].each do |has_array|  
    # if has_array[:players] ==  player_name 
 
  end   #return  has_array[:points]
  end
end
  end  
 
  end
 
end
  
end


def shoe_size(player_name)
  
baskt_hash = game_hash
 
  
  baskt_hash.each do |key,value|
   
  value.each do |team_level_key,team_value|
     
    if team_level_key == :players  
      
      team_value.each do |stats|
        stats.each do |stats_key,stats_value|
         
        if stats_value == player_name
          
        return  stats[:shoe]  
       
  end   
  end
end
  end  
 
  end
 
end
  
end

def team_colors(team_name)
  
    baskt_hash = game_hash
    baskt_hash.each do |key,value|
      value.each do |team_level_key,team_value|
      
        if team_value == team_name
          
        #if team_value == "Brooklyn Nets"
         return value[:colors]
         
        else
         value[:colors]
        end
      
      end
      
    end
  end      
  
  
def   team_names
new_arry = []
 baskt_hash = game_hash
    baskt_hash.each do |key,value|
     
       new_arry << value[:team_name]
   end
   return new_arry
   
    end
    
 def   player_numbers(team_name)
      array_teamnames =  team_names
       baskt_hash = game_hash
        brooklyn_arry = []
        charlotte_arry = []
         i = 0 
  while i < baskt_hash[:home][:players].length   
               brooklyn_arry.sort! << baskt_hash[:home][:players][i][:number]
               charlotte_arry.sort! << baskt_hash[:away][:players][i][:number]
                  i += 1
 end
      if   array_teamnames[1] == team_name
         
        return  brooklyn_arry.sort!
      else
        return charlotte_arry.sort!
      end

 end
  

 def player_stats(player_name)
   new_hash = {} 
   
  baskt_hash = game_hash 
baskt_hash.each do |key, value|
 value.each do |team_key, team_value|
   if team_key == :players
     team_value.each do |stats|
           stats.each do |in_key,in_stats|
             
             
               if stats[:player_name] == player_name
                
              
           new_hash = stats.delete_if do |in_key,in_stats|
            in_key == :player_name
          
          end
          
                 
                
             end
           end
         end
       end
     end
     
  end
  return  new_hash
end 


def big_shoe_rebounds
  new_arry = []
  
  baskt_hash = game_hash 
  baskt_hash.each do |key, value|
  value.each do |team_key, team_value|
   if team_key == :players
      team_value.each do |stats|
           stats.each do |in_key,in_stats|
             if in_key == :shoe
             new_arry << in_stats
          end   
           end
           
         end
         
       end
     end
   end
   new_arry.sort!
   
    biggest_shoe = new_arry.last
   baskt_hash = game_hash 
  baskt_hash.each do |key, value|
  value.each do |team_key, team_value|
   if team_key == :players
      team_value.each do |stats|
           stats.each do |in_key,in_stats|
             if in_key == :shoe
      
               if biggest_shoe == in_stats
                 
                 return stats[:rebounds]
                 
                       end           
                  end
     
              end
   
           end
  
       end
     end
  
     end
      
 end           
      
 def bonus
 end
 
def  most_points_scored
 new_arry = []
 
   baskt_hash = game_hash 
  baskt_hash.each do |key, value|
  value.each do |team_key, team_value|
   if team_key == :players
      team_value.each do |stats|
           stats.each do |in_key,in_stats|
             if   in_key == :points
               new_arry << stats[:points]
               
          end   
           end
           
         end
         
       end
     end
   end  
    new_arry.sort!
   
    most_pionts = new_arry.last
    
   baskt_hash = game_hash 
  baskt_hash.each do |key, value|
  value.each do |team_key, team_value|
   if team_key == :players
      team_value.each do |stats|
           stats.each do |in_key,in_stats|
             if   in_key == :points
               if most_pionts == in_stats
                #binding.pry
                 return stats[:player_name]
               
               end
            end
        end
      end
   end
  end
end
end 


 
def  winning_team
 
  nets_total = 0
  baskt_hash = game_hash
  new_arry = []
  new_arry = team_names
  i = 0 
  while i < baskt_hash[:home][:players].length   
  nets_total += baskt_hash[:home][:players][i][:points]
      i += 1
  end
  charlotte_total = 0 
  x = 0 
  while x < baskt_hash[:away][:players].length
  charlotte_total += baskt_hash[:away][:players][x][:points]
  x += 1
  
 end
 
 if charlotte_total > nets_total
   return new_arry[0]
 else
   return new_arry[1]
end 
binding.pry
end              
  
  
  
def  player_with_longest_name 
  new_arry = []
    baskt_hash = game_hash 
  baskt_hash.each do |key, value|
  value.each do |team_key, team_value|
   if team_key == :players
      team_value.each do |stats|
           stats.each do |in_key,in_stats|
             if  in_key == :player_name 
                 new_arry << stats[in_key] 

               end
            end
                
        end
      end
   end
  end
  return new_arry.max_by{|name| name.length}
 
  
 end      
     
  
#sales.inject(0) {|sum, hash| sum + hash["sale_price"]

def long_name_steals_a_ton?
  long_name = player_with_longest_name 
  
   new_arry = []
    baskt_hash = game_hash 
  baskt_hash.each do |key, value|
  value.each do |team_key, team_value|
   if team_key == :players
      team_value.each do |stats|
           stats.each do |in_key,in_stats|
             if  in_key == :steals
               new_arry << stats[:steals]
               
                end
            end
                
        end
      end
   end
  end
steal_tone = new_arry.max
 
 baskt_hash.each do |key, value|
  value.each do |team_key, team_value|
   if team_key == :players
      team_value.each do |stats|
           stats.each do |in_key,in_stats|
           
             if  in_key == :steals 
                 if in_stats == steal_tone
                   loname_tone = stats[:player_name]
                   
                   if long_name == loname_tone
                     
                     return true
                   else
                     return false
                   end
                   
            end
       end
      end
                
        end
      end
   end
  end
 end 


