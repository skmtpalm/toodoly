class ChangeDescriptionNotNullToTasks < ActiveRecord::Migration[5.1]
  def up
    change_column_null :tasks, :description, true
  end

  def down
    change_column_null :tasks, :description, false
  end
end
