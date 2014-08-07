class AddCompletedColumnToTasksTable < ActiveRecord::Migration
  def change
    add_column :tasks, :completed?, :integer, default: 0
  end
end
