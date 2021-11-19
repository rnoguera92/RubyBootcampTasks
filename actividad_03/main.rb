$LOAD_PATH << './lib'
require 'team.rb'
require 'match.rb'
require 'tournament.rb'

matches = [
  { :home_name => 'A', :home_score => 3, :visitor_name => 'B', :visitor_score => 1 },
  { :home_name => 'C', :home_score => 0, :visitor_name => 'D', :visitor_score => 0 },
  { :home_name => 'A', :home_score => 1, :visitor_name => 'C', :visitor_score => 1 },
  { :home_name => 'B', :home_score => 2, :visitor_name => 'D', :visitor_score => 3 },
  { :home_name => 'A', :home_score => 2, :visitor_name => 'D', :visitor_score => 1 },
  { :home_name => 'B', :home_score => 3, :visitor_name => 'C', :visitor_score => 1 }
]

Tournament.new(matches).play!
