$teams = {"A" => 0, "B" => 0, "C" => 0, "D" => 0}

def team_validation(team_name)
	team_name.upcase.match("[A,B,C,D]")? true : (puts "Error, please input a valid team name" ; false)
end
def score_validation(score)
	score.match("[0-9]")? true: (puts "Error, please input a valid score" ; false)
end
def print_results
  puts "Do you want to add another match?[Y/N]"
  quit = gets.upcase.chomp.strip	
  input_match_score if quit == "Y"
  system "clear"
  system "cls"
  puts "Tournament result:"
  $teams.sort_by{|team, score| score}.reverse.each{ | key, value| puts " Team #{key} Scored #{value} Points"}
  exit
end
def input_match_score
  system "clear"
  system "cls"
  puts "Input team name [A-D]"
  first_team = gets.upcase.chomp.strip # had a headache with this due to the \n
  print_results if !team_validation(first_team)
  puts "Input score:"
  first_team_score = gets.chomp.strip
  (print_results) if !score_validation(first_team_score)
  puts "Input opponent team name [A-D]"
  second_team = gets.upcase.chomp.strip
  (print_results) if !team_validation(second_team)
  (puts "Error! you have to select a different team, reseting in 3 secs..." ; sleep(3); input_match_score) if first_team == second_team
  puts "Input opponent score:"
  second_team_score = gets.chomp.strip
  (print_results) if !score_validation(second_team_score)
  ($teams[first_team] += 3) if first_team_score.to_i > second_team_score.to_i 
  ($teams[second_team] += 3) if first_team_score.to_i < second_team_score.to_i 
  ($teams[first_team] += 1 ; $teams[second_team] += 1) if first_team_score.to_i == second_team_score.to_i 
  print_results	
end
input_match_score