class Tournament
  #attr_accessor teams, matches
  def initialize
  	@teams = [] 
  	@matches = []
  end
  def set_teams(matches)
  	matches.each{ |value|
  	  if @teams.count == 0
        @teams << Team.new(value["home_team_name"])
      else
      	@teams << Team.new(value["home_team_name"]) if @teams.select{|team| team.team_name == value["home_team_name"]}.count == 0
      	@teams << Team.new(value["visitor_team_name"]) if @teams.select{|team| team.team_name == value["visitor_team_name"]}.count == 0
      end
  	}
  end
  def set_matches(matches)
  	matches.each { |value| 
  	  @matches << Match.new(value["home_team_name"],value["home_team_score"],value["visitor_team_name"],value["visitor_team_score"]) 
  	  set_team_score(value["home_team_name"], 3) if value["home_team_score"] > value["visitor_team_score"]
  	  set_team_score(value["visitor_team_name"], 3) if value["home_team_score"] < value["visitor_team_score"]
  	  (set_team_score(value["home_team_name"],1) ; set_team_score(value["visitor_team_name"],1) ) if value["home_team_score"] == value["visitor_team_score"]
  	}
  end
  def set_team_score(team_name, score)
  	@teams.each_with_index{ |v,k| ( @teams[k].add_score(score) ; break ) if v.team_name == team_name }
  end
  def print_results
    @teams.sort_by{|team| team.score}.reverse.each{ |team| puts " Team #{team.team_name} Scored #{team.score} Points"}
  end
end