require 'tournament/team.rb'
class Tournament
  WIN_SCORE = 3
  TIE_SCORE = 1

  def initialize(matches)
    @matches = matches
    names    = @matches.map { |match| [match[:home_name], match[:visitor_name]] }.flatten!.uniq!
    @teams   = names.map { |name| Team.new(name) }
  end

  def play!
    @matches.each do |match|
      if match[:home_score] > match[:visitor_score]
        set_team_score(match[:home_name], WIN_SCORE)
      elsif match[:home_score] < match[:visitor_score]
        set_team_score(match[:visitor_name], WIN_SCORE)
      else
        set_team_score(match[:home_name],TIE_SCORE)
        set_team_score(match[:visitor_name],TIE_SCORE)
      end
    end

    @teams.sort_by! { |team| -team.score }
    @teams.each { |team| puts "Team '#{team.name}' Scored #{team.score} Points" }
  end

  private

  def set_team_score(team_name, score)
    @teams.select {|team| team.name == team_name}.first&.add_score(score)
  end
end