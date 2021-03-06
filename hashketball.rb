require 'pry'
def game_hash
  {
    away: { 
      team_name: 'Charlotte Hornets',
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
        { player_name: 'Bismack Biyombo',
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10 },
        { player_name: 'DeSagna Diop',
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5 },
        { player_name: 'Ben Gordon',
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0 },
        { player_name: 'Kemba Walker',
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12 }
            ] },
    home: { 
      team_name: 'Brooklyn Nets',
      colors: ["Black", "White"],
      players: [
        { player_name: 'Alan Anderson',
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1 },
        { player_name: 'Reggie Evans',
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7 },
        { player_name: 'Brook Lopez',
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15 },
        { player_name: 'Mason Plumlee',
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5 },
        { player_name: 'Jason Terry',
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1 }
      ] }
  }
end
  


def num_points_scored(name)
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if name == player[:player_name] 
        return player[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if name == player[:player_name] 
        return player[:shoe]
      end
    end
  end
end

def team_colors(team)
  if team.downcase == "charlotte hornets" 
    return game_hash[:away][:colors]
  else return game_hash[:home][:colors]
  end
end

def team_names
  game_hash.map do |team, team_info|
    team_info[:team_name]
  end
end

def player_numbers(name)
  output = []
  game_hash.each do |team, team_info|
    if name== team_info[:team_name]  
      team_info.each do |key, value|
        if key == :players
          value.each do |player|
          output.push(player[:number])
          end
        end
      end
    end
  end
  return output
end

def player_stats(name)
  game_hash.each do |team, team_info|
    team_info.each do |key, value|
      if key == :players
        value.each do |player|
          if name == player[:player_name]
            player.delete(:player_name) 
            return player
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  big = 0
  rebounds = 0
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:shoe] > big
        big = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  return rebounds
end

#bono 
def most_points_scored

  
  big_boy = ""
  most = 0
  game_hash.values.each do |team_info|
    team_info[:players].each do |player|
      if player[:points] > most
        most = player[:points] 
        big_boy = player[:player_name] 
      end
    end
  end
  return big_boy
end


def winning_team

  winner = {}
  game_hash.values.each do |team_info|
    team_points = 0
    team_info[:players].each do |player|
      team_points += player[:points]
    end
    winner[team_info[:team_name]] = team_points
  end
  winner.key(winner.values.max) 
end


def player_with_longest_name

  long= []
  game_hash.values.each do |team_info|
    team_info[:players].each do |player|
      long << player[:player_name]
    end
  end
long.max_by{|name| name.length}
end


def long_name_steals_a_ton?

 long = {}
  game_hash.values.each do |team_info|
    team_info[:players].each do |player|
      long[player[:player_name]] = player[:steals]
    end
  end

max_steals = long.values.max
long[long.key(max_steals)] == max_steals

end