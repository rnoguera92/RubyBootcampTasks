class Team
  attr_reader :name, :score

  def initialize(name)
    @name  = name
    @score = 0
  end

  def add_score(score)
    @score += score
  end
end