class AddLevelToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :level, :string
  end
end
