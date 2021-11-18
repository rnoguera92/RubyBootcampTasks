class Team
     attr_reader :team_name, :score	
	 def initialize(team_name)
	 	@team_name = team_name
	 	@score = 0
	 end
	 def add_score(score)
	 	@score += score
	 end
end