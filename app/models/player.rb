class Player < ApplicationRecord
  belongs_to :team

  def self.complete_salaries
    players = []
    Player.all.each do |x|
      players << { 'nombre': x.name, 'goles_minimos': x.team.team_goal.required_goals[x.level],
                   'goles': x.goals, 'sueldo': x.salary,
                   'bono': x.bonus, 'sueldo_completo': x.complete_salary,
                   'equipo': x.team.name
                 }
    end
    return players
  end

  def complete_salary
    return salary_with_bonus
  end

  def salary_with_bonus
    (self.bonus * total_bonus_percentage) + self.salary
  end


  def team_required_goals
    self.team.team_goal.required_goals.map{|key, value| value}.sum.to_f
  end

  def player_required_goals
    self.team.team_goal.required_goals[self.level].to_f
  end

  def total_bonus_percentage
    self.total_player_bonus_percentage(player_required_goals) + self.total_team_bonus_percentage(team_required_goals)
  end

  def total_player_bonus_percentage(required_goals)
    reached_percentage = (self.goals / required_goals)
    reached_percentage = 1.0 if reached_percentage > 1.0
    return reached_percentage / 2
  end

  def total_team_bonus_percentage(required_goals)
    reached_percentage = (Player.all.pluck(:goals).sum / required_goals)
    reached_percentage = 1.0 if reached_percentage > 1.0
    return reached_percentage / 2
  end
end
