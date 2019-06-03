class CreateTeamGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :team_goals do |t|
      t.json :required_goals

      t.timestamps
    end
  end
end
