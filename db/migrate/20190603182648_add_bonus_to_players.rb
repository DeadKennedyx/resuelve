class AddBonusToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :bonus, :integer
  end
end
