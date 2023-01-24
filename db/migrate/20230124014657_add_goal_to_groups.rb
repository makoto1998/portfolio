class AddGoalToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :goal, :index
  end
end
