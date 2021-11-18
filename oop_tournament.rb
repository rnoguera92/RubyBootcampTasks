$LOAD_PATH << './lib'
require "Team.rb"
require "Match.rb"
require "Tournament.rb"



matches = [
	{"home_team_name"=>"A","home_team_score"=>3,"visitor_team_name"=>"B","visitor_team_score"=>1},
	{"home_team_name"=>"C","home_team_score"=>0,"visitor_team_name"=>"D","visitor_team_score"=>0},
	{"home_team_name"=>"A","home_team_score"=>1,"visitor_team_name"=>"C","visitor_team_score"=>1},
	{"home_team_name"=>"B","home_team_score"=>2,"visitor_team_name"=>"D","visitor_team_score"=>3},
	{"home_team_name"=>"A","home_team_score"=>2,"visitor_team_name"=>"D","visitor_team_score"=>1},
	{"home_team_name"=>"B","home_team_score"=>3,"visitor_team_name"=>"C","visitor_team_score"=>1}
]
tournament = Tournament.new
tournament.set_teams(matches)
tournament.set_matches(matches)
tournament.print_results