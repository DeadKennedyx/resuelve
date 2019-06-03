class AddTeamGoalToTeams < ActiveRecord::Migration[5.2]
  def change
    add_reference :teams, :team_goal, foreign_key: true
    add_reference :team_goals, :team, foreign_key: true
  end
end
